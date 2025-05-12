/*
You are given an integer array nums and a positive integer k.

Return the number of subarrays where the maximum element of nums appears at least k times in that subarray.

A subarray is a contiguous sequence of elements within an array.
*/

function countSubarrays(nums: number[], k: number): number {
    let result = 0;
    let left = 0;
    let right = 0;

    let max = Math.max(...nums);
    let counterMax = 0;

    for (right = 0; right < nums.length; right++) {
        if (nums[right] === max) counterMax++;

        while (counterMax >= k && left <= right) {
            result += nums.length - right;

            if (nums[left] === max) counterMax--;
            left++;
        }
    }

    return result;
};

console.log(countSubarrays([1,3,2,3,3], 2)); // 6
console.log(countSubarrays([1,4,2,1], 3)); // 0