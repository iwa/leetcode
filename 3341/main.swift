/*
There is a dungeon with n x m rooms arranged as a grid.

You are given a 2D array moveTime of size n x m, where moveTime[i][j] represents the minimum time in seconds when you can start moving to that room.
You start from the room (0, 0) at time t = 0 and can move to an adjacent room. Moving between adjacent rooms takes exactly one second.

Return the minimum time to reach the room (n - 1, m - 1).

Two rooms are adjacent if they share a common wall, either horizontally or vertically.
*/

class Solution {
    func minTimeToReach(_ moveTime: [[Int]]) -> Int {
        let n = moveTime.count
        let m = moveTime[0].count
        var dp = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        var queue = [(Int, Int, Int)]()  // (time, row, col)
        queue.append((0, 0, 0))
        let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        while !queue.isEmpty {
            queue.sort { $0.0 < $1.0 } // Simulate min-heap (slow)
            let (currTime, currRow, currCol) = queue.removeFirst()
            if currTime >= dp[currRow][currCol] { continue }
            if currRow == n - 1 && currCol == m - 1 { return currTime }
            dp[currRow][currCol] = currTime

            for (dx, dy) in directions {
                let nextRow = currRow + dx
                let nextCol = currCol + dy
                if nextRow >= 0 && nextRow < n && nextCol >= 0 && nextCol < m &&
                   dp[nextRow][nextCol] == Int.max {
                    let nextTime = max(moveTime[nextRow][nextCol], currTime) + 1
                    queue.append((nextTime, nextRow, nextCol))
                }
            }
        }
        return -1
    }
}

let s = Solution()

print(s.minTimeToReach([[0, 4], [4, 4]]))  // 6
print(s.minTimeToReach([[0, 0, 0], [0, 0, 0]]))  // 3
print(s.minTimeToReach([[0, 1], [1, 2]]))  // 3
