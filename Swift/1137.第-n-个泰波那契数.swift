/*
 * @lc app=leetcode.cn id=1137 lang=swift
 *
 * [1137] 第 N 个泰波那契数
 *
 * https://leetcode.cn/problems/n-th-tribonacci-number/description/
 *
 * algorithms
 * Easy (61.00%)
 * Likes:    279
 * Dislikes: 0
 * Total Accepted:    170.1K
 * Total Submissions: 278.9K
 * Testcase Example:  '4'
 *
 * 泰波那契序列 Tn 定义如下： 
 * 
 * T0 = 0, T1 = 1, T2 = 1, 且在 n >= 0 的条件下 Tn+3 = Tn + Tn+1 + Tn+2
 * 
 * 给你整数 n，请返回第 n 个泰波那契数 Tn 的值。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：n = 4
 * 输出：4
 * 解释：
 * T_3 = 0 + 1 + 1 = 2
 * T_4 = 1 + 1 + 2 = 4
 * 
 * 
 * 示例 2：
 * 
 * 输入：n = 25
 * 输出：1389537
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 <= n <= 37
 * 答案保证是一个 32 位整数，即 answer <= 2^31 - 1。
 * 
 * 
 */

// @lc code=start
class Solution {
    func tribonacci(_ n: Int) -> Int {
        switch n {
        case 0: return 0
        case 1: return 1
        case 2: return 1
        default:
            if let fn = dp[n] { return fn }
            let fn = tribonacci(n - 3) + tribonacci(n - 2) + tribonacci(n - 1)
            dp[n] = fn
            return fn
        }
    }
}
// @lc code=end

