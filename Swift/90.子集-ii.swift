/*
 * @lc app=leetcode.cn id=90 lang=swift
 *
 * [90] 子集 II
 *
 * https://leetcode-cn.com/problems/subsets-ii/description/
 *
 * algorithms
 * Medium (63.41%)
 * Likes:    776
 * Dislikes: 0
 * Total Accepted:    180K
 * Total Submissions: 283.8K
 * Testcase Example:  '[1,2,2]'
 *
 * 给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。
 * 
 * 解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。
 * 
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [1,2,2]
 * 输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
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
 * 
 * 
 * 
 * 
 */

// @lc code=start
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        backtrack(nums.sorted(), start: 0, track: [])
        return res
    }
    private var res = [[Int]]()
    private func backtrack(_ nums: [Int], start: Int, track: [Int]) {
        res.append(track)

        var track = track
        for i in start..<nums.count {
            if i > start, nums[i] == nums[i - 1] { continue }
            track.append(nums[i])
            backtrack(nums, start: i + 1, track: track)
            track.removeLast()
        }
    }
}
// @lc code=end

