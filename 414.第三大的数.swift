/*
 * @lc app=leetcode.cn id=414 lang=swift
 *
 * [414] 第三大的数
 *
 * https://leetcode-cn.com/problems/third-maximum-number/description/
 *
 * algorithms
 * Easy (35.57%)
 * Likes:    191
 * Dislikes: 0
 * Total Accepted:    41.1K
 * Total Submissions: 115.5K
 * Testcase Example:  '[3,2,1]'
 *
 * 给定一个非空数组，返回此数组中第三大的数。如果不存在，则返回数组中最大的数。要求算法时间复杂度必须是O(n)。
 * 
 * 示例 1:
 * 
 * 
 * 输入: [3, 2, 1]
 * 
 * 输出: 1
 * 
 * 解释: 第三大的数是 1.
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: [1, 2]
 * 
 * 输出: 2
 * 
 * 解释: 第三大的数不存在, 所以返回最大的数 2 .
 * 
 * 
 * 示例 3:
 * 
 * 
 * 输入: [2, 2, 3, 1]
 * 
 * 输出: 1
 * 
 * 解释: 注意，要求返回第三大的数，是指第三大且唯一出现的数。
 * 存在两个值为2的数，它们都排第二。
 * 
 * 
 */

// @lc code=start
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var max: (Int, Int?, Int?) = (nums[0], nil, nil)
        for i in 1..<nums.count {
            let num = nums[i]
            guard max.0 != num else { continue }
            guard max.0 > num else {
                max.2 = max.1
                max.1 = max.0
                max.0 = num
                continue
            }
            guard let max1 = max.1 else {
                max.1 = num
                continue
            }
            guard max1 != num else { continue }
            guard max1 > num else {
                max.2 = max.1
                max.1 = num
                continue
            }
            guard let max2 = max.2 else {
                max.2 = num
                continue
            }
            guard num > max2 else { continue }
            max.2 = num
        }
        return max.2 ?? max.0
    }
}
// @lc code=end
