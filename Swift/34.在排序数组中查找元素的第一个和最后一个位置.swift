/*
 * @lc app=leetcode.cn id=34 lang=swift
 *
 * [34] 在排序数组中查找元素的第一个和最后一个位置
 *
 * https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
 *
 * algorithms
 * Medium (42.30%)
 * Likes:    871
 * Dislikes: 0
 * Total Accepted:    213.9K
 * Total Submissions: 505.7K
 * Testcase Example:  '[5,7,7,8,8,10]\n8'
 *
 * 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
 * 
 * 如果数组中不存在目标值 target，返回 [-1, -1]。
 * 
 * 进阶：
 * 
 * 
 * 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [5,7,7,8,8,10], target = 8
 * 输出：[3,4]
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [5,7,7,8,8,10], target = 6
 * 输出：[-1,-1]
 * 
 * 示例 3：
 * 
 * 
 * 输入：nums = [], target = 0
 * 输出：[-1,-1]
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 
 * -10^9 
 * nums 是一个非递减数组
 * -10^9 
 * 
 * 
 */

// @lc code=start
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
    }
}
// @lc code=end

class Solution1 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var first = -1
        var last = -1
        var i = 0
        var j = nums.count - 1
        while i <= j {
            if first == -1 {
                if nums[i] == target {
                    first = i
                } else {
                    i += 1
                }
            }
            if last == -1 {
                if nums[j] == target {
                    last = j
                } else {
                    j -= 1
                }
            }
            if first != -1, last != -1 {
                break
            }
        }
        return [first, last]
    }
}

let solution = Solution()
print(solution.searchRange([1], 1))
print(solution.searchRange([1, 2, 3], 1))
