class Solution {
    func triangleType(_ nums: [Int]) -> String {
        if nums[0] == 0 && nums[1] == 0 && nums[2] == 0 {
            return "none"
        }

        if nums[0] == nums[1] && nums[1] == nums[2] {
            return "equilateral"
        }

        if (nums[0] == nums[1] || nums[1] == nums[2] || nums[0] == nums[2])
            && (nums[0] + nums[1] > nums[2]) && (nums[1] + nums[2] > nums[0])
            && (nums[0] + nums[2] > nums[1])
        {
            return "isosceles"
        }

        if nums[0] != nums[1] && nums[1] != nums[2] && nums[0] != nums[2]
            && (nums[0] + nums[1] > nums[2]) && (nums[1] + nums[2] > nums[0])
            && (nums[0] + nums[2] > nums[1])
        {
            return "scalene"
        }

        return "none"
    }
}
