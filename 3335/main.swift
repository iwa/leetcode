class Solution {
    private static let mod = 1000000007

    private func mod_add(_ a: Int, _ b: Int) -> Int {
        let a = a % Solution.mod
        let b = b % Solution.mod
        return ((a + b) % Solution.mod + Solution.mod) % Solution.mod
    }

    func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
        var nums = Array(repeating: 0, count: 26)

        // Count characters in the string
        for ch in s {
            let index = Int(ch.asciiValue! - Character("a").asciiValue!)
            nums[index] += 1
        }

        // Apply transformations
        var remainingT = t
        while remainingT > 0 {
            var cur = Array(repeating: 0, count: 26)

            for j in 0..<26 {
                if j == 25 && nums[j] > 0 {
                    cur[0] = mod_add(cur[0], nums[j])
                    cur[1] = mod_add(cur[1], nums[j])
                } else {
                    if j < 25 {
                        cur[j + 1] = mod_add(cur[j + 1], nums[j])
                    }
                }
            }

            nums = cur
            remainingT -= 1
        }

        // Calculate final string length
        var ans = 0
        for i in nums {
            ans = mod_add(ans, i)
        }

        return ans
    }
}