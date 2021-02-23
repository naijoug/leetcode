/*
 * @lc app=leetcode.cn id=697 lang=swift
 *
 * [697] 数组的度
 *
 * https://leetcode-cn.com/problems/degree-of-an-array/description/
 *
 * algorithms
 * Easy (55.00%)
 * Likes:    194
 * Dislikes: 0
 * Total Accepted:    27.8K
 * Total Submissions: 50.6K
 * Testcase Example:  '[1,2,2,3,1]'
 *
 * 给定一个非空且只包含非负数的整数数组 nums, 数组的度的定义是指数组里任一元素出现频数的最大值。
 * 
 * 你的任务是找到与 nums 拥有相同大小的度的最短连续子数组，返回其长度。
 * 
 * 示例 1:
 * 
 * 
 * 输入: [1, 2, 2, 3, 1]
 * 输出: 2
 * 解释: 
 * 输入数组的度是2，因为元素1和2的出现频数最大，均为2.
 * 连续子数组里面拥有相同度的有如下所示:
 * [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 * 最短连续子数组[2, 2]的长度为2，所以返回2.
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: [1,2,2,3,1,4,2]
 * 输出: 6
 * 
 * 
 * 注意:
 * 
 * 
 * nums.length 在1到50,000区间范围内。
 * nums[i] 是一个在0到49,999范围内的整数。
 * 
 * 
 */

// @lc code=start
class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 1 }
        // find the max degress
        var map = [Int: (Int, Int, Int)]()
        var max = Int.min
        for i in 0..<nums.count {
            let num = nums[i]
            var value = map[num] ?? (0, -1, -1)
            value.0 += 1
            if value.0 > max {
                max = value.0
            }
            if value.1 == -1 {
                value.1 = i
            } else {
                value.2 = i
            }
            map[num] = value
        }
        // find the min sub array
        var min = Int.max
        for key in map.keys {
            guard let value = map[key],
                  value.0 == max, value.2 > value.1 else { continue }
            let delta = value.2 - value.1 + 1
            if delta < min {
                min = delta
            }
        }
        //print("max: \(max) | min: \(min) | \(map)")
        return min == Int.max ? 1 : min
    }
}
// @lc code=end

let solution = Solution()
print("\(solution.findShortestSubArray([1]))")
print("\(solution.findShortestSubArray([2, 1]))")
print("\(solution.findShortestSubArray([1, 2, 2, 3, 1]))")
print("\(solution.findShortestSubArray([1, 2, 2, 3, 1, 4, 2]))")
