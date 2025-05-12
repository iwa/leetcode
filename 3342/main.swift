import Foundation

class Solution {
    func minTimeToReach(_ moveTime: [[Int]]) -> Int {
        let n = moveTime.count, m = moveTime[0].count
        // dp[row][col][parity] = best time arriving at (row,col) when next move‐cost parity=parity
        var dp = Array(
            repeating: Array(
                repeating: [Int.max, Int.max],
                count: m
            ),
            count: n
        )
        // heap elements: (time, row, col, parity)
        var heap = Heap<(Int, Int, Int, Int)>(sort: { $0.0 < $1.0 })
        heap.insert((0, 0, 0, 0))     // start at (0,0), next move‐cost = 1s (parity=0)

        let dirs = [(1,0),(0,1),(-1,0),(0,-1)]

        while let (t, r, c, p) = heap.remove() {
            if t >= dp[r][c][p] { continue }
            if r == n-1 && c == m-1 { return t }
            dp[r][c][p] = t

            let cost = (p == 0 ? 1 : 2)
            let nextP = 1 - p
            for (dx,dy) in dirs {
                let nr = r + dx, nc = c + dy
                guard nr >= 0, nr < n, nc >= 0, nc < m else { continue }
                // can't attempt move until moveTime[nr][nc]
                let start = max(t, moveTime[nr][nc])
                let nt = start + cost
                if nt < dp[nr][nc][nextP] {
                    heap.insert((nt, nr, nc, nextP))
                }
            }
        }

        return -1  // unreachable
    }
}

/// simple min‐heap
struct Heap<T> {
    var elements: [T] = []
    let sort: (T,T)->Bool

    init(sort: @escaping (T,T)->Bool) { self.sort = sort }

    var isEmpty: Bool { elements.isEmpty }
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count-1)
        let v = elements.removeLast()
        siftDown(from: 0)
        return v
    }

    private mutating func siftUp(from i: Int) {
        var child = i
        var parent = (child-1)/2
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child-1)/2
        }
    }
    private mutating func siftDown(from i: Int) {
        var parent = i
        while true {
            let l = 2*parent + 1, r = l + 1
            var candidate = parent
            if l < elements.count && sort(elements[l], elements[candidate]) {
                candidate = l
            }
            if r < elements.count && sort(elements[r], elements[candidate]) {
                candidate = r
            }
            if candidate == parent { break }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
