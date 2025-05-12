// function countSubarrays(nums: number[]): number {
//     let result = 0;

//     for (let i = 0; i < (nums.length - 2); i++) {
//         if((nums[i] + nums[i+2]) === (nums[i+1] / 2))
//             result++;
//     }

//     return result;
// };

function countSubarrays(nums: number[]): number {
    return nums.reduce((previous, _, index) => {
        if (index > nums.length - 3) return previous;
        if ((nums[index] + nums[index + 2]) === (nums[index + 1] / 2)) {
            return previous + 1;
        }
        return previous;
    }, 0);
};

console.log(countSubarrays([1,2,1,4,1])); // 1