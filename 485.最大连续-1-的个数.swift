/*
 * @lc app=leetcode.cn id=485 lang=swift
 *
 * [485] 最大连续1的个数
 *
 * https://leetcode-cn.com/problems/max-consecutive-ones/description/
 *
 * algorithms
 * Easy (56.88%)
 * Likes:    150
 * Dislikes: 0
 * Total Accepted:    63.4K
 * Total Submissions: 111.5K
 * Testcase Example:  '[1,0,1,1,0,1]'
 *
 * 给定一个二进制数组， 计算其中最大连续1的个数。
 * 
 * 示例 1:
 * 
 * 
 * 输入: [1,1,0,1,1,1]
 * 输出: 3
 * 解释: 开头的两位和最后的三位都是连续1，所以最大连续1的个数是 3.
 * 
 * 
 * 注意：
 * 
 * 
 * 输入的数组只包含 0 和1。
 * 输入数组的长度是正整数，且不超过 10,000。
 * 
 * 
 */

// @lc code=start
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var max = 0
        var count = 0
        for num in nums {
            if num == 1 {
                count += 1
            } else {
                if count > max {
                    max = count
                }
                count = 0
            }
        }
        if count > max {
            max = count
        }
        return max
    }
}
// @lc code=end
