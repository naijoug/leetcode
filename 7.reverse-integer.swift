/*
 * @lc app=leetcode id=7 lang=swift
 *
 * [7] Reverse Integer
 *
 * https://leetcode.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (25.49%)
 * Likes:    2663
 * Dislikes: 4150
 * Total Accepted:    886.3K
 * Total Submissions: 3.5M
 * Testcase Example:  '123'
 *
 * Given a 32-bit signed integer, reverse digits of an integer.
 * 
 * Example 1:
 * 
 * 
 * Input: 123
 * Output: 321
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: -123
 * Output: -321
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: 120
 * Output: 21
 * 
 * 
 * Note:
 * Assume we are dealing with an environment which could only store integers
 * within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose
 * of this problem, assume that your function returns 0 when the reversed
 * integer overflows.
 * 
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x
        var result = 0
        while num != 0 {
            let remainder = num%10
            result = result*10 + remainder
            num = num/10
        }
        return result
    }
}
// @lc code=end

let solution = Solution()
print(solution.reverse(123))
print(solution.reverse(-123))
print(solution.reverse(120))
print(solution.reverse(1534236469)) // 0