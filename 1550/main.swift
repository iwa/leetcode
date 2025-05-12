/*
Given an integer array arr, return true if there are three consecutive odd numbers in the array.
Otherwise, return false.
*/

class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        if arr.count < 3 {
            return false
        }

        for i in 0...(arr.count-3) {
            if arr[i] % 2 == 1 && arr[i+1] % 2 == 1 && arr[i+2] % 2 == 1 {
                return true
            }
        }

        return false
    }
}

let s = Solution()

print(s.threeConsecutiveOdds([2,6,4,1])) // false
print(s.threeConsecutiveOdds([1,2,1,1])) // false