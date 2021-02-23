/*
 * @lc app=leetcode.cn id=665 lang=swift
 *
 * [665] 非递减数列
 *
 * https://leetcode-cn.com/problems/non-decreasing-array/description/
 *
 * algorithms
 * Easy (23.23%)
 * Likes:    389
 * Dislikes: 0
 * Total Accepted:    32.5K
 * Total Submissions: 139.7K
 * Testcase Example:  '[4,2,3]'
 *
 * 给你一个长度为 n 的整数数组，请你判断在 最多 改变 1 个元素的情况下，该数组能否变成一个非递减数列。
 * 
 * 我们是这样定义一个非递减数列的： 对于数组中所有的 i (0 <= i <= n-2)，总满足 nums[i] <= nums[i + 1]。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入: nums = [4,2,3]
 * 输出: true
 * 解释: 你可以通过把第一个4变成1来使得它成为一个非递减数列。
 * 
 * 
 * 示例 2:
 * 
 * 输入: nums = [4,2,1]
 * 输出: false
 * 解释: 你不能在只改变一个元素的情况下将其变为非递减数列。
 * 
 * 
 * 
 * 
 * 说明：
 * 
 * 
 * 1 <= n <= 10 ^ 4
 * - 10 ^ 5 <= nums[i] <= 10 ^ 5
 * 
 * 
 */

// @lc code=start
class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var iNums = nums
        let count = iNums.count
        guard count > 2 else { return true }
        var fix = 0
        for i in 0..<(count - 1) {
            guard iNums[i] > iNums[i + 1] else { continue }
            fix += 1
            if fix > 1 { return false }
            guard i > 0, iNums[i - 1] > iNums[i + 1] else { continue }
            iNums[i + 1] = iNums[i]
        }
        return true
    }
}
// @lc code=end

let solution = Solution()
print(solution.checkPossibility([4, 2, 3]))
print(solution.checkPossibility([4, 2, 1]))
print(solution.checkPossibility([3, 4, 2, 3]))
print(solution.checkPossibility([-1, 4, 2, 3]))
