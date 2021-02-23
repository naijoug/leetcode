/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 *
 * https://leetcode-cn.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (33.28%)
 * Likes:    1521
 * Dislikes: 0
 * Total Accepted:    235.9K
 * Total Submissions: 708.6K
 * Testcase Example:  '123'
 *
 * 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 * 
 * 示例 1:
 * 
 * 输入: 123
 * 输出: 321
 * 
 * 
 * 示例 2:
 * 
 * 输入: -123
 * 输出: -321
 * 
 * 
 * 示例 3:
 * 
 * 输入: 120
 * 输出: 21
 * 
 * 
 * 注意:
 * 
 * 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回
 * 0。
 * 
 */

// @lc code=start
class Solution {
    let quotientMax = 214748364    // Int32.max / 10
    let quotientMin = -214748364   // Int32.min / 10
    let remainderMax = 7   // Int32.max % 10
    let remainderMin = -8  // Int32.min % 10

    func reverse(_ x: Int) -> Int {
        var num = x
        var result = 0
        while num != 0 {
            let remainder = num % 10
            guard result <= quotientMax, result >= quotientMin else { return 0 }
            if result == quotientMax && remainder > remainderMax { return 0 }
            if result == quotientMin && remainder < remainderMin { return 0 }
            result = result * 10 + remainder
            num /= 10
        }
        return result
    }
}
// @lc code=end

let solution = Solution()
 print("\(solution.quotientMax) \(solution.quotientMin) \(solution.remainderMax) \(solution.remainderMin)")
print(solution.reverse(123))
print(solution.reverse(-123))
print(solution.reverse(120))
print(solution.reverse(-2147483412))
print(solution.reverse(21474836478))
