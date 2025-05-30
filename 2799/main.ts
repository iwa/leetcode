function countCompleteSubarrays(nums: number[]): number {
    const count = new Set<number>(nums).size;
    let left = 0;
    let right = 0;
    let result = 0;
    let freq = new Map<number, number>;

    for (right = 0; right < nums.length; right++) {
        freq.set(nums[right], (freq.get(nums[right]) || 0) + 1);

        while (freq.size === count) {
            result += (nums.length - right); // Tous les sous arrays entre left et right sont complets

            freq.set(nums[left], (freq.get(nums[left]) || 1) - 1);

            if(freq.get(nums[left]) === 0) {
                freq.delete(nums[left]);
            }

            left++;
        }
    }

    return result;
};


console.log(countCompleteSubarrays([1, 3, 1, 2, 2])); // 4
// console.log(countCompleteSubarrays([5,5,5,5])); // 10
// console.log(countCompleteSubarrays([1113, 1113, 1103, 431, 1159, 1456, 1456, 1404, 1978, 942, 527, 67, 1526, 465, 269, 60, 1166, 1028, 1404, 668, 1299, 1307, 1214, 1526, 172, 1959, 1504, 1896, 1400, 379, 1619, 401, 379, 418, 728, 645, 1456, 1113, 1456, 201, 1647, 1526, 156, 668, 76, 951, 83, 882, 76, 184, 1802, 180, 1470, 1855, 993, 1498, 119, 668, 527, 1, 431, 416, 1113, 312, 1829, 1400, 30, 438, 477, 1931, 486, 1166, 111, 1704, 1166, 516, 628, 402, 882, 220, 1855, 1173, 581, 1094, 1811, 703, 697, 1371, 1173, 3, 843, 1578, 288, 1436, 898, 749, 220, 739, 1434, 437, 1709, 1069, 1610, 581, 1404, 354, 551, 1737, 1852, 1919, 156, 1508, 252, 866, 1740, 64, 1662, 825, 175, 765, 1862, 882, 1740, 1488, 966, 220, 1349, 1022, 1055, 1456, 695, 1931, 1496, 1734, 1802, 1802, 749, 1224, 438, 285, 634, 622, 14, 1689, 491, 883, 1884, 42, 1517, 151, 15, 911, 313, 548, 898, 1734, 1740, 645, 1514, 269, 1377, 966, 750, 1619, 647, 12, 1114, 1307, 335, 1595, 1669, 1141, 1147, 416, 1731, 111, 1435, 1783, 1504, 765, 586, 203, 437, 230, 1701, 1537, 401, 1001, 783, 1400, 1357, 869, 717, 1645, 1034, 98, 1933, 195, 1826, 1166, 203, 162, 1377, 1834, 1141, 156, 1802, 952, 522, 1783, 570, 502, 1054, 1829, 231, 924, 1241, 112, 305, 361, 1075, 67, 996, 817, 1312, 335, 709, 631, 1529, 523, 394, 586, 1487, 1794, 911, 289, 1931, 1430, 1299, 911, 1910, 638, 1690, 749, 668, 1662, 974, 1456, 926, 1617, 402, 1577, 1628, 856, 1857, 1737, 269, 1959, 1166, 910, 697, 1734, 723, 1873, 1141, 1157, 765, 628, 455, 1224]));