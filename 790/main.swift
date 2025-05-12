import Swift
import Foundation

class Solution {
    func numTilings(_ n: Int) -> Int {
        let mod = 1000000007

        if (n <= 1) {
            return 1
        }
        if (n == 2) {
            return 2
        }
        if (n == 3) {
            return 5
        }

        var dp = [Int](repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        dp[2] = 2
        dp[3] = 5

        for i in 4...n {
            dp[i] = ( (2 * dp[i - 1] + dp[i - 3]) % mod)
        }

        return dp[n]
    }
}

let s = Solution()

print(s.numTilings(4))