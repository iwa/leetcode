class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: nums.count)

        for n in nums {
            result[n] = nums[nums[n]]
        }

        return result
    }
}

let s = Solution()

print(s.buildArray([0,2,1,5,3,4])) // [0,1,2,4,5,3]
print(s.buildArray([5,0,1,2,3,4])) // [4,5,0,1,2,3]