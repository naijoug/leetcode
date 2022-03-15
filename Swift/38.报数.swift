/*
 * @lc app=leetcode.cn id=38 lang=swift
 *
 * [38] 报数
 *
 * https://leetcode-cn.com/problems/count-and-say/description/
 *
 * algorithms
 * Easy (48.10%)
 * Likes:    372
 * Dislikes: 0
 * Total Accepted:    66.6K
 * Total Submissions: 123.2K
 * Testcase Example:  '1'
 *
 * 「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。前五项如下：
 * 
 * 1.     1
 * 2.     11
 * 3.     21
 * 4.     1211
 * 5.     111221
 * 
 * 
 * 1 被读作  "one 1"  ("一个一") , 即 11。
 * 11 被读作 "two 1s" ("两个一"）, 即 21。
 * 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
 * 
 * 给定一个正整数 n（1 ≤ n ≤ 30），输出外观数列的第 n 项。
 * 
 * 注意：整数序列中的每一项将表示为一个字符串。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入: 1
 * 输出: "1"
 * 
 * 
 * 示例 2:
 * 
 * 输入: 4
 * 输出: "1211"
 * 
 * 
 */

// @lc code=start
class Solution {
    func countAndSay(_ n: Int) -> String {
        guard n > 1 else { return "1" }
        var result = ""
        var say = ""
        var count = 0
        for s in countAndSay(n-1) {
            if say == String(s) {
                count += 1
            } else {
                if count > 0 {
                    result += "\(count)\(say)"
                }
                say = String(s)
                count = 1
            }
        }
        result += "\(count)\(say)"
        return result
    }
}
// @lc code=end

let solution = Solution()
for i in 1..<31 {
    print(solution.countAndSay(i))
}
