import Foundation

// class Solution {
//     func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
//         var result = 0

//         for i in 0...(dominoes.count-2) {
//             print(dominoes[i])

//             for j in i+1...(dominoes.count-1) {
//                 if (dominoes[i][0] == dominoes[j][0] && dominoes[i][1] == dominoes[j][1]) ||
//                    (dominoes[i][0] == dominoes[j][1] && dominoes[i][1] == dominoes[j][0]) {
//                     result += 1;
//                 }
//             }
//         }

//         return result
//     }
// }

class Solution {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var result = 0
        var count = [Int](repeating: 0, count: 100)

        for domino in dominoes {
            let id = (domino[0] > domino[1]) ? domino[0]*10 + domino[1] : domino[1]*10 + domino[0]

            result += count[id]
            count[id] += 1
        }

        return result
    }
}

let solution = Solution()
// print(solution.numEquivDominoPairs([[1,2],[2,1],[3,4],[5,6]])) // 1
// print(solution.numEquivDominoPairs([[1,2],[1,2],[1,1],[1,2],[2,2]])) // 3
print(solution.numEquivDominoPairs([[2,1],[1,2],[1,2],[1,2],[2,1],[1,1],[1,2],[2,2]])) // 15