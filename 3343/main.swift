class Solution {
    let mod = 1_000_000_007
    var fact: [Int] = []
    var inv: [Int] = []
    var invFact: [Int] = []

    private func precompute(_ n: Int) {
        fact = Array(repeating: 1, count: n + 1)
        inv  = Array(repeating: 1, count: n + 1)
        invFact = Array(repeating: 1, count: n + 1)

        for i in 1...n {
            fact[i] = Int((Int64(fact[i - 1]) * Int64(i)) % Int64(mod))
        }
        // modular inverses via Fermat's little theorem
        inv[n] = modPow(fact[n], mod - 2)
        for i in stride(from: n, through: 1, by: -1) {
            invFact[i - 1] = Int((Int64(invFact[i]) * Int64(i)) % Int64(mod))
        }
        for i in 1...n {
            inv[i] = Int((Int64(fact[i - 1]) * Int64(invFact[i])) % Int64(mod))
        }
    }

    private func modPow(_ base: Int, _ exp: Int) -> Int {
        var result = 1
        var b = base
        var e = exp
        while e > 0 {
            if e & 1 == 1 {
                result = Int((Int64(result) * Int64(b)) % Int64(mod))
            }
            b = Int((Int64(b) * Int64(b)) % Int64(mod))
            e >>= 1
        }
        return result
    }

    func countBalancedPermutations(_ num: String) -> Int {
        let n = num.count
        let sumAll = num.compactMap { $0.wholeNumberValue }.reduce(0, +)
        // if total sum odd, cannot balance
        guard sumAll % 2 == 0 else { return 0 }

        // store input midway as required
        let velunexorai = num

        // count digit frequencies
        var digitCount = Array(repeating: 0, count: 10)
        let digits = velunexorai.compactMap { $0.wholeNumberValue }
        for d in digits { digitCount[d] += 1 }

        // positions: evens = ceil(n/2), odds = floor(n/2)
        let evenCount = (n + 1) / 2
        let oddCount  = n / 2
        let targetSum = sumAll / 2

        // prep factorials up to n
        precompute(n)

        // dp[s][k] = ways to pick k digits summing to s (combinatorial counts C(cnt_d,ke))
        var dp = Array(
            repeating: Array(repeating: 0, count: evenCount + 1),
            count: targetSum + 1
        )
        dp[0][0] = 1

        for d in 0...9 {
            let cnt = digitCount[d]
            if cnt == 0 { continue }
            for _ in 1...cnt {
                // one at a time to handle binomial choices
                for s in stride(from: targetSum, through: d, by: -1) {
                    for k in stride(from: evenCount, through: 1, by: -1) {
                        dp[s][k] = (dp[s][k] + dp[s - d][k - 1]) % mod
                    }
                }
            }
        }

        // dpWays = number of ways to choose which digits go to even positions
        let dpWays = dp[targetSum][evenCount]
        if dpWays == 0 { return 0 }

        // multiply by permutations within even/odd slots, divide out identical digits
        var res = dpWays
        res = Int((Int64(res) * Int64(fact[evenCount])) % Int64(mod))
        res = Int((Int64(res) * Int64(fact[oddCount]))  % Int64(mod))
        for cnt in digitCount {
            res = Int((Int64(res) * Int64(invFact[cnt])) % Int64(mod))
        }

        return res
    }
}

let s = Solution()

print(s.countBalancedPermutations("123")) // 2
print(s.countBalancedPermutations("1122"))  // 4