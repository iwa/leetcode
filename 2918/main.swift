class Solution {
    func minSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var zerosN1 = 0, zerosN2 = 0
        var sumN1 = 0, sumN2 = 0

        for n in nums1 {
            if n == 0 {
                zerosN1 += 1
                sumN1 += 1
            }

            sumN1 += n
        }

        for n in nums2 {
            if n == 0 {
                zerosN2 += 1
                sumN2 += 1
            }

            sumN2 += n
        }

        if (sumN1 < sumN2 && zerosN1 == 0) || (sumN2 < sumN1 && zerosN2 == 0) {
            return -1
        }

        if sumN2 > sumN1 {
            return sumN2
        }

        return sumN1
    }
}