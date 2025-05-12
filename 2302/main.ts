/*
The score of an array is defined as the product of its sum and its length.

    For example, the score of [1, 2, 3, 4, 5] is (1 + 2 + 3 + 4 + 5) * 5 = 75.

Given a positive integer array nums and an integer k,
return the number of non-empty subarrays of nums whose score is strictly less than k.

A subarray is a contiguous sequence of elements within an array.
*/

/* time-out
function calcScore(nums: number[]): number {
    return nums.reduce((previous, current) => previous += current, 0) * nums.length;
}

function countSubarrays(nums: number[], k: number): number {
    let result = 0;
    let left = 0;
    let right = 0;

    let window: number[] = [];

    for (right = 0; right < nums.length; right++) {
        window.push(nums[right]);
        let subScore = calcScore(window);

        // we use invert condition in the loop to move the left boundary when score is above condition
        // we do that cause the condition needs score less than k, so each attempts will add +1 to the score
        // until the score is above condition, we then move left to reduce score until it matches condition again
        while (subScore >= k && left <= right) {
            // we push left boundary of window by one
            window.shift();
            left++;

            // recalculate subScore
            subScore = calcScore(window);
        }

        // all valid subarrays from left to right and all in-between
        result += (right - left + 1);
    }

    return result;
};
*/

function countSubarrays(nums: number[], k: number): number {
    let result = 0;
    let left = 0;
    let right = 0;

    let sum = 0;

    for (right = 0; right < nums.length; right++) {
        sum += nums[right];

        // we use invert condition in the loop to move the left boundary when score is above condition
        // we do that cause the condition needs score less than k, so each attempts will add +1 to the score
        // until the score is above condition, we then move left to reduce score until it matches condition again
        // we continously calculate the sum that we multiply by (right - left + 1), which is the actual length of the subarray
        while (sum * (right - left + 1) >= k && left <= right) {
            // we push left boundary of window by one
            sum -= nums[left];
            left++;
        }

        // all valid subarrays from left to right and all in-between
        result += (right - left + 1);
    }

    return result;
};

console.log(countSubarrays([2,1,4,3,5], 10)); // 6