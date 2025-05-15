/*
You are given a string array words and a binary array groups both of length n, where words[i] is associated with groups[i].

Your task is to select the longest alternating

from words. A subsequence of words is alternating if for any two consecutive strings in the sequence, their corresponding elements in the binary array groups differ. Essentially, you are to choose strings such that adjacent elements have non-matching corresponding bits in the groups array.

Formally, you need to find the longest subsequence of an array of indices [0, 1, ..., n - 1] denoted as [i0, i1, ..., ik-1], such that groups[ij] != groups[ij+1] for each 0 <= j < k - 1 and then find the words corresponding to these indices.

Return the selected subsequence. If there are multiple answers, return any of them.

Note: The elements in words are distinct.
*/

class Solution {
    func getLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        var result = [words[0]]
        var current = groups[0] == 0 ? false : true

        if words.count > 1 {
            for i in 1...words.count - 1 {
                if !current && groups[i] == 1 {
                    result.append(words[i])
                    current = true
                } else if current && groups[i] == 0 {
                    result.append(words[i])
                    current = false
                }
            }
        }

        return result
    }
}
