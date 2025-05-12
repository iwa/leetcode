// function getMin(nums: number[]) {
//     return nums.reduce((previous, current) => (current < previous ? current : previous), nums[0]);
// }

// function getMax(nums: number[]) {
//     return nums.reduce((previous, current) => (current > previous ? current : previous), nums[0]);
// }

// function countSubarrays(nums: number[], minK: number, maxK: number): number {
//     let left = 0;
//     let right = 0;
//     let result = 0;
//     let currentSub: number[] = [];

//     for (right = 0; right < nums.length; right++) {
//         currentSub.push(nums[right]);

//         while (getMin(currentSub) == minK && getMax(currentSub) == maxK) {
//             result++;
//             left++;
//             currentSub.shift();
//         }
//     }

//     return result;
// };

function countSubarrays(nums: number[], minK: number, maxK: number): number {
    let result = 0;
    let minPosition = -1;
    let maxPosition = -1;
    let leftBound = -1;

    for (let i = 0; i < nums.length; i++) {
        const num = nums[i];

        if (num < minK || num > maxK) {
            leftBound = i;
        }
        if (num == minK) {
            minPosition = i;
        }
        if (num == maxK) {
            maxPosition = i;
        }

        const validBound = Math.min(minPosition, maxPosition);
        if (validBound > leftBound) {
            result += validBound - leftBound;
        }
    }

    return result;
}


console.log(countSubarrays([1,3,5,2,7,5], 1, 5));