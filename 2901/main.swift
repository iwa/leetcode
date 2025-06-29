class Solution {
    func differByOneChar(_ word1: String, _ word2: String) -> Bool {
        if word1.count != word2.count { return false }
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        var diffCount = 0

        for i in 0..<word1.count {
            if word1Array[i] != word2Array[i] {
                diffCount += 1
            }
        }

        return diffCount == 1
    }

    func getWordsInLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        let n = groups.count
        var dp = Array(repeating: 1, count: n)
        var parent = Array(repeating: -1, count: n)
        var maxi = 0

        for i in 0..<n {
            for j in 0..<i {
                if groups[i] != groups[j] && differByOneChar(words[i], words[j])
                    && dp[i] < dp[j] + 1
                {
                    dp[i] = dp[j] + 1
                    parent[i] = j
                }
            }
            if dp[i] > maxi { maxi = dp[i] }
        }

        var result = [String]()
        for i in 0..<n {
            if dp[i] == maxi {
                var index = i
                while index != -1 {
                    result.append(words[index])
                    index = parent[index]
                }
                break
            }
        }

        return result.reversed()
    }
}
