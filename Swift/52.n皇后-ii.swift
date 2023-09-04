/*
 * @lc app=leetcode.cn id=52 lang=swift
 *
 * [52] N皇后 II
 *
 * https://leetcode-cn.com/problems/n-queens-ii/description/
 *
 * algorithms
 * Hard (82.24%)
 * Likes:    342
 * Dislikes: 0
 * Total Accepted:    86.8K
 * Total Submissions: 105.5K
 * Testcase Example:  '4'
 *
 * n 皇后问题 研究的是如何将 n 个皇后放置在 n × n 的棋盘上，并且使皇后彼此之间不能相互攻击。
 * 
 * 给你一个整数 n ，返回 n 皇后问题 不同的解决方案的数量。
 * 
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：n = 4
 * 输出：2
 * 解释：如上图所示，4 皇后问题存在两个不同的解法。
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：n = 1
 * 输出：1
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= n <= 9
 * 
 * 
 * 
 * 
 */

// @lc code=start
class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var board = [[Character]].init(repeating: [Character].init(repeating: Character("."), count: n), count: n)
        backtrack(&board, row: 0)
        return res.count
    }
    private var res = [[[Character]]]()
    private func backtrack(_ board: inout [[Character]], row: Int) {
        guard row < board.count else {
            res.append(board)
            return
        }
        for col in 0..<board[row].count {
            guard isValid(board, row: row, col: col) else { continue }
            board[row][col] = Character("Q")
            backtrack(&board, row: row + 1)
            board[row][col] = Character(".")
        }
    }
    private func isValid(_ board: [[Character]], row: Int, col: Int) -> Bool {
        func chess(row: Int, col: Int) -> Character? {
            guard 0 <= row, row < board.count, 
                  0 <= col, col < board[row].count else { return nil }
            return board[row][col]
        }
        func isQ(row: Int, col: Int) -> Bool {
            guard let chess = chess(row: row, col: col) else { return false }
            return String(chess) == "Q"
        }
        // -
        for i in 0..<col {
            guard isQ(row: row, col: i) else { continue }
            return false
        }
        // |
        for i in 0..<row {
            guard isQ(row: i, col: col) else { continue }
            return false
        }
        // \
        var i = row
        var j = col
        while i >= 0, j >= 0 {
            i -= 1
            j -= 1
            guard isQ(row: i, col: j) else { continue }
            return false
        }
        // /
        var m = row
        var n = col
        while m >= 0, n < board.count {
            m -= 1
            n += 1
            guard isQ(row: m, col: n) else { continue }
            return false
        }

        return true
    }
}
// @lc code=end

