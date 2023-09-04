/*
 * @lc app=leetcode.cn id=78 lang=swift
 *
 * [78] 子集
 *
 * https://leetcode-cn.com/problems/subsets/description/
 *
 * algorithms
 * Medium (80.37%)
 * Likes:    1544
 * Dislikes: 0
 * Total Accepted:    403.1K
 * Total Submissions: 501.5K
 * Testcase Example:  '[1,2,3]'
 *
 * 给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
 * 
 * 解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [1,2,3]
 * 输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [0]
 * 输出：[[],[0]]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * -10 
 * nums 中的所有元素 互不相同
 * 
 * 
 */

// @lc code=start
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        backtrack(nums, track: [], start: 0)
        return res
    }
    private var res = [[Int]]()
    private func backtrack(_ nums: [Int], track: [Int], start: Int) {
        res.append(track)

        var track = track
        for i in start..<nums.count {
            track.append(nums[i])
            backtrack(nums, track: track, start: i + 1)
            track.removeLast()
        }
    }
}
// @lc code=end

