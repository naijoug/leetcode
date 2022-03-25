/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 *
 * https://leetcode-cn.com/problems/combinations/description/
 *
 * algorithms
 * Medium (76.97%)
 * Likes:    913
 * Dislikes: 0
 * Total Accepted:    308.8K
 * Total Submissions: 401.1K
 * Testcase Example:  '4\n2'
 *
 * 给定两个整数 n 和 k，返回范围 [1, n] 中所有可能的 k 个数的组合。
 * 
 * 你可以按 任何顺序 返回答案。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：n = 4, k = 2
 * 输出：
 * [
 * ⁠ [2,4],
 * ⁠ [3,4],
 * ⁠ [2,3],
 * ⁠ [1,2],
 * ⁠ [1,3],
 * ⁠ [1,4],
 * ]
 * 
 * 示例 2：
 * 
 * 
 * 输入：n = 1, k = 1
 * 输出：[[1]]
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * 1 
 * 
 * 
 */

// @lc code=start
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        backtrack(n, start: 1, k: k, track: [])
        return res
    }
    private var res = [[Int]]()
    private func backtrack(_ n: Int, start: Int, k: Int, track: [Int]) {
        if track.count == k {
            res.append(track)
            return
        }

        var track = track
        for i in start..<(n + 1) {
            track.append(i)
            backtrack(n, start: i + 1, k: k, track: track)
            track.removeLast()
        }
    }
}
// @lc code=end

let solution = Solution()
print(solution.combine(4, 2))