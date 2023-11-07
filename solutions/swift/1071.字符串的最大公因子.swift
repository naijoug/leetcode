/*
 * @lc app=leetcode.cn id=1071 lang=swift
 *
 * [1071] 字符串的最大公因子
 *
 * https://leetcode.cn/problems/greatest-common-divisor-of-strings/description/
 *
 * algorithms
 * Easy (57.76%)
 * Likes:    353
 * Dislikes: 0
 * Total Accepted:    62.8K
 * Total Submissions: 108.7K
 * Testcase Example:  '"ABCABC"\n"ABC"'
 *
 * 对于字符串 s 和 t，只有在 s = t + ... + t（t 自身连接 1 次或多次）时，我们才认定 “t 能除尽 s”。
 * 
 * 给定两个字符串 str1 和 str2 。返回 最长字符串 x，要求满足 x 能除尽 str1 且 x 能除尽 str2 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：str1 = "ABCABC", str2 = "ABC"
 * 输出："ABC"
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：str1 = "ABABAB", str2 = "ABAB"
 * 输出："AB"
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：str1 = "LEET", str2 = "CODE"
 * 输出：""
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= str1.length, str2.length <= 1000
 * str1 和 str2 由大写英文字母组成
 * 
 * 
 */

// @lc code=start
class Solution {
    private func gcd(_ num1: Int, _ num2: Int) -> Int {
        var num1 = num1
        var num2 = num2
        var remainder = num1 % num2 
        while remainder != 0 {
            num1 = num2
            num2 = remainder
            remainder = num1 % num2
        }
        return num2
    }

    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1 + str2 == str2 + str1 else { return "" }
        return String(str1.prefix(gcd(str1.count, str2.count)))
    }
}
// @lc code=end

let solution = Solution()
print("result: \(solution.gcdOfStrings("ABCABC", "ABC"))")