/*
 * @lc app=leetcode.cn id=46 lang=swift
 *
 * [46] 全排列
 *
 * https://leetcode-cn.com/problems/permutations/description/
 *
 * algorithms
 * Medium (78.48%)
 * Likes:    1874
 * Dislikes: 0
 * Total Accepted:    556.6K
 * Total Submissions: 709K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [1,2,3]
 * 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [0,1]
 * 输出：[[0,1],[1,0]]
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：nums = [1]
 * 输出：[[1]]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= nums.length <= 6
 * -10 <= nums[i] <= 10
 * nums 中的所有整数 互不相同
 * 
 * 
 */

// @lc code=start
class Solution {
    private var res = [[Int]]()
    func permute(_ nums: [Int]) -> [[Int]] {
        backtrack(nums, track: [], used: [:])
        return res
    }
    private func backtrack(_ nums: [Int], track: [Int], used: [Int: Bool]) {
        guard track.count != nums.count else {
            res.append(track)
            return
        }
        var track = track
        var used = used
        for num in nums {
            guard !(used[num] ?? false) else { continue }
            used[num] = true
            track.append(num)
            backtrack(nums, track: track, used: used)
            track.removeLast()
            used[num] = false
        }
    } 
}
// @lc code=end

