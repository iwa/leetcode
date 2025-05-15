class Solution {
    private let mod = 1000000007

    private func multiplyMatrices(_ A: [[Int64]], _ B: [[Int64]]) -> [[Int64]] {
        let rowsA = A.count, colsA = A[0].count, colsB = B[0].count
        var result = Array(repeating: Array(repeating: Int64(0), count: colsB), count: rowsA)

        for i in 0..<rowsA {
            for j in 0..<colsB {
                var sum: Int64 = 0
                for k in 0..<colsA {
                    sum = (sum + (A[i][k] * B[k][j]) % Int64(mod)) % Int64(mod)
                }
                result[i][j] = sum
            }
        }

        return result
    }

    private func powerMatrix(_ matrix: [[Int64]], _ exponent: Int) -> [[Int64]] {
        let n = matrix.count
        var result = Array(repeating: Array(repeating: Int64(0), count: n), count: n)
        for i in 0..<n {
            result[i][i] = 1
        }

        var base = matrix
        var exp = exponent

        while exp > 0 {
            if (exp & 1) == 1 {
                result = multiplyMatrices(result, base)
            }
            base = multiplyMatrices(base, base)
            exp >>= 1
        }

        return result
    }

    func lengthAfterTransformations(_ s: String, _ t: Int, _ nums: [Int]) -> Int {
        var transform = Array(repeating: Array(repeating: Int64(0), count: 26), count: 26)

        for i in 0..<26 {
            for shift in 0..<nums[i] {
                transform[i][(i + 1 + shift) % 26] += 1
            }
        }

        let transformPower = powerMatrix(transform, t)
        var freq = Array(repeating: Array(repeating: Int64(0), count: 26), count: 1)

        for char in s {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            freq[0][index] += 1
        }

        let resultFreq = multiplyMatrices(freq, transformPower)
        var total: Int64 = 0

        for cnt in resultFreq[0] {
            total = (total + cnt) % Int64(mod)
        }

        return Int(total)
    }
}