class Solution {
    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        let mod = 1_000_000_007

        // Calculate all valid color combinations for a single column
        var validStates: [Int] = []
        generateValidStates(0, 0, m, &validStates)

        // Create a mapping from state to index for faster lookups
        var stateToIndex: [Int: Int] = [:]
        for (index, state) in validStates.enumerated() {
            stateToIndex[state] = index
        }

        let stateCount = validStates.count

        // Create compatibility matrix between states
        var compatibility = Array(
            repeating: Array(repeating: false, count: stateCount), count: stateCount)
        for i in 0..<stateCount {
            for j in 0..<stateCount {
                if areCompatible(validStates[i], validStates[j], m) {
                    compatibility[i][j] = true
                }
            }
        }

        // Initialize DP array
        var dp = Array(repeating: 1, count: stateCount)

        // Calculate for each column
        for col in 1..<n {
            var newDp = Array(repeating: 0, count: stateCount)

            for j in 0..<stateCount {
                for i in 0..<stateCount {
                    if compatibility[i][j] {
                        newDp[j] = (newDp[j] + dp[i]) % mod
                    }
                }
            }

            dp = newDp
        }

        // Sum up all possibilities
        return dp.reduce(0) { ($0 + $1) % mod }
    }

    // Generate all valid column states where no adjacent cells have the same color
    private func generateValidStates(_ state: Int, _ pos: Int, _ m: Int, _ validStates: inout [Int])
    {
        if pos == m {
            validStates.append(state)
            return
        }

        let prevColor = pos > 0 ? (state >> ((pos - 1) * 2)) & 3 : 0

        // Try all 3 colors (1: red, 2: green, 3: blue)
        for color in 1...3 {
            if color != prevColor {
                // Encode color in 2 bits and append to state
                let newState = state | (color << (pos * 2))
                generateValidStates(newState, pos + 1, m, &validStates)
            }
        }
    }

    // Check if two adjacent columns are compatible (no horizontal adjacent same colors)
    private func areCompatible(_ state1: Int, _ state2: Int, _ m: Int) -> Bool {
        for i in 0..<m {
            let color1 = (state1 >> (i * 2)) & 3
            let color2 = (state2 >> (i * 2)) & 3

            if color1 == color2 {
                return false
            }
        }
        return true
    }
}
