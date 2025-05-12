/*
You are given an integer array digits, where each element is a digit. The array may contain duplicates.

You need to find all the unique integers that follow the given requirements:

    The integer consists of the concatenation of three elements from digits in any arbitrary order.
    The integer does not have leading zeros.
    The integer is even.

For example, if the given digits were [1, 2, 3], integers 132 and 312 follow the requirements.

Return a sorted array of the unique integers.
*/

/*
class Solution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var result: [Int] = []
        var usage: [Int: Int] = [:]
        var oneEvenPresent = false

        for n in digits {
            usage[n] = usage[n] != nil ? usage[n]! + 1 : 1
            if n % 2 == 0 && !oneEvenPresent {
                oneEvenPresent = true
            }
        }

        if !oneEvenPresent {
            return []
        }

        for n in digits {
            if n != 0 {
                var usagewithoutn = usage
                usagewithoutn[n]! -= 1

                if usagewithoutn[n]! <= 0 {
                    usagewithoutn.removeValue(forKey: n)
                }

                for k in usagewithoutn.keys {
                    var usagewithoutk = usagewithoutn
                    usagewithoutk[k]! -= 1

                    if usagewithoutk[k]! <= 0 {
                        usagewithoutk.removeValue(forKey: k)
                    }

                    for p in usagewithoutk.keys {
                        let aaa = "\(n)\(k)\(p)"
                        let bbb = Int(aaa)

                        if bbb != nil {
                            result.append(bbb!)
                        }
                    }
                }
            }
        }

        print(usage)

        return []
    }
}
*/

class Solution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var frequency = [Int](repeating: 0, count: 10)

        for digit in digits {
            frequency[digit] += 1
        }

        var result = [Int]()

        for i in 1...9 {
            if frequency[i] == 0 { continue }
            frequency[i] -= 1

            for j in 0...9 {
                if frequency[j] == 0 { continue }
                frequency[j] -= 1

                for k in stride(from: 0, through: 8, by: 2) {
                    if frequency[k] == 0 { continue }
                    result.append(i * 100 + j * 10 + k)
                }

                frequency[j] += 1
            }

            frequency[i] += 1
        }

        return result
    }
}

let s = Solution()

print(s.findEvenNumbers([2, 1, 3, 0]))  // [102,120,130,132,210,230,302,310,312,320]
