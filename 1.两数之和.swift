/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 *
 * https://leetcode-cn.com/problems/two-sum/description/
 *
 * algorithms
 * Easy (47.08%)
 * Likes:    7119
 * Dislikes: 0
 * Total Accepted:    721.4K
 * Total Submissions: 1.5M
 * Testcase Example:  '[2,7,11,15]\n9'
 *
 * 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 * 
 * 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 * 
 * 示例:
 * 
 * 给定 nums = [2, 7, 11, 15], target = 9
 * 
 * 因为 nums[0] + nums[1] = 2 + 7 = 9
 * 所以返回 [0, 1]
 * 
 * 
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let array = nums
        var map = [Int: Int]()
        for i in 0..<array.count {
            let value = array[i]
            if let index = map[target - value] {
                return [index, i]
            }
            map[value] = i
        }
        return []
    }
}
// @lc code=end

let solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))
