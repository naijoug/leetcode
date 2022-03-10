/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 *
 * https://leetcode-cn.com/problems/palindrome-number/description/
 *
 * algorithms
 * Easy (56.66%)
 * Likes:    843
 * Dislikes: 0
 * Total Accepted:    213.9K
 * Total Submissions: 377.4K
 * Testcase Example:  '121'
 *
 * 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 * 
 * 示例 1:
 * 
 * 输入: 121
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入: -121
 * 输出: false
 * 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 * 
 * 
 * 示例 3:
 * 
 * 输入: 10
 * 输出: false
 * 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 * 
 * 
 * 进阶:
 * 
 * 你能不将整数转为字符串来解决这个问题吗？
 * 
 */

// @lc code=start
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var num = x
        var digits = [Int]()
        while num > 0 {
            digits.append(num % 10)
            num /= 10
        }
        var i = 0
        var j = digits.count - 1
        while i < j {
            guard digits[i] == digits[j] else { return false }
            i += 1
            j -= 1
        }
        return true
    }
}
// @lc code=end

let solution = Solution()
print(solution.isPalindrome(121))
print(solution.isPalindrome(-121))
print(solution.isPalindrome(10))
