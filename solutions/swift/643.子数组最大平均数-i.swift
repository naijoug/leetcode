/*
 * @lc app=leetcode.cn id=643 lang=swift
 *
 * [643] 子数组最大平均数 I
 *
 * https://leetcode.cn/problems/maximum-average-subarray-i/description/
 *
 * algorithms
 * Easy (43.18%)
 * Likes:    319
 * Dislikes: 0
 * Total Accepted:    118.6K
 * Total Submissions: 275.1K
 * Testcase Example:  '[1,12,-5,-6,50,3]\n4'
 *
 * 给你一个由 n 个元素组成的整数数组 nums 和一个整数 k 。
 * 
 * 请你找出平均数最大且 长度为 k 的连续子数组，并输出该最大平均数。
 * 
 * 任何误差小于 10^-5 的答案都将被视为正确答案。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [1,12,-5,-6,50,3], k = 4
 * 输出：12.75
 * 解释：最大平均数 (12-5-6+50)/4 = 51/4 = 12.75
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [5], k = 1
 * 输出：5.00000
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * n == nums.length
 * 1 <= k <= n <= 10^5
 * -10^4 <= nums[i] <= 10^4
 * 
 * 
 */

// @lc code=start
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var sum = 0
        for i in 0..<k {
            sum += nums[i]
        }
        var max = sum
        for i in 1..<(nums.count - k + 1) {
            sum = sum - nums[i - 1] + nums[i + k - 1]
            max = sum > max ? sum : max
        }
        return Double(max) / Double(k)
    }
}
// @lc code=end

class Solution1 {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var max = Int.min
        for i in 0..<(nums.count - k + 1) {
            var sum = 0
            for j in i..<(i + k) {
                sum += nums[j]
            }
            max = sum > max ? sum : max
        }
        return Double(max) / Double(k)
    }
}

let solution = Solution()
print("value: \(solution.findMaxAverage([5], 1))")
print("value: \(solution.findMaxAverage([3,3,4,3,0], 3))")
print("value: \(solution.findMaxAverage([0,1,1,3,3], 4))")
print("\(solution.findMaxAverage([0,4,0,3,2], 1))")