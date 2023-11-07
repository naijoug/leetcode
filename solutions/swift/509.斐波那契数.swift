/*
 * @lc app=leetcode.cn id=509 lang=swift
 *
 * [509] 斐波那契数
 *
 * https://leetcode-cn.com/problems/fibonacci-number/description/
 *
 * algorithms
 * Easy (66.20%)
 * Likes:    223
 * Dislikes: 0
 * Total Accepted:    132.1K
 * Total Submissions: 193.8K
 * Testcase Example:  '2'
 *
 * 斐波那契数，通常用 F(n) 表示，形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：
 * 
 * 
 * F(0) = 0，F(1) = 1
 * F(n) = F(n - 1) + F(n - 2)，其中 n > 1
 * 
 * 
 * 给你 n ，请计算 F(n) 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：2
 * 输出：1
 * 解释：F(2) = F(1) + F(0) = 1 + 0 = 1
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：3
 * 输出：2
 * 解释：F(3) = F(2) + F(1) = 1 + 1 = 2
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：4
 * 输出：3
 * 解释：F(4) = F(3) + F(2) = 2 + 1 = 3
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 
 * 
 * 
 */

// @lc code=start
class Solution {
    func fib(_ n: Int) -> Int {
        guard n != 0, n != 1 else { return n }
        var fn_1: Int = 1
        var fn_2: Int = 0
        var fn: Int = 0
        for _ in 2..<(n + 1) {
            fn = fn_1 + fn_2
            fn_2 = fn_1
            fn_1 = fn
        }
        return fn
    }
}
// @lc code=end

class Solution3 {
    private var dp: [Int: Int] = [0: 0, 1: 1]
    func fib(_ n: Int) -> Int {
        if let fn = dp[n] { return fn }
        for i in dp.count..<(n + 1) {
            dp[i] = (dp[i - 1] ?? 0) + (dp[i - 2] ?? 0)
        }
        return dp[n] ?? 0
    }
}

class Solution2 {
    private var dp: [Int: Int] = [0: 0, 1: 1]
    func fib(_ n: Int) -> Int {
        if let fn = dp[n] { return fn }
        let fn = fib(n - 1) + fib(n - 2)
        dp[n] = fn
        return fn
    }
}

class Solution1 {
    func fib(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        return fib(n - 1) + fib(n - 2)
    }
}

let solution = Solution()
print(solution.fib(4))

let solution3 = Solution3()
print(solution3.fib(4))

let solution2 = Solution2()
print(solution2.fib(4))

let solution1 = Solution1()
print(solution1.fib(4))