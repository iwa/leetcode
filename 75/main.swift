/*
Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent,
with the colors in the order red, white, and blue.

We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

You must solve this problem without using the library's sort function.
*/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var usage = [Int](repeating: 0, count: 3)
        var result = [Int]()

        for n in nums {
            usage[n] += 1
        }

        print(usage)

        var j = 0
        for m in usage {
            var i = 0

            while i < m {
                result.append(j)
                i += 1
            }

            j += 1
        }

        nums = result
    }
}

let s = Solution()

var aaa = [2,0,2,1,1,0]
s.sortColors(&aaa)
print(aaa) // [0,0,1,1,2,2]