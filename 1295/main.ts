/*
Given an array nums of integers, return how many of them contain an even number of digits.
*/

// function findNumbers(nums: number[]): number {
//     let result = 0;

//     for (const element of nums) {
//         if (element.toString().length % 2 === 0) result++;
//     }

//     return result;
// };

function findNumbers(nums: number[]): number {
    return nums.reduce((count, current) => current.toString().length % 2 === 0 ? count+1 : count, 0);
};

console.log(findNumbers([12,345,2,6,7896])); // 2