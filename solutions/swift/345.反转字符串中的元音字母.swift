/*
 * @lc app=leetcode.cn id=345 lang=swift
 *
 * [345] 反转字符串中的元音字母
 *
 * https://leetcode.cn/problems/reverse-vowels-of-a-string/description/
 *
 * algorithms
 * Easy (54.53%)
 * Likes:    326
 * Dislikes: 0
 * Total Accepted:    177.6K
 * Total Submissions: 325.6K
 * Testcase Example:  '"hello"'
 *
 * 给你一个字符串 s ，仅反转字符串中的所有元音字母，并返回结果字符串。
 * 
 * 元音字母包括 'a'、'e'、'i'、'o'、'u'，且可能以大小写两种形式出现不止一次。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：s = "hello"
 * 输出："holle"
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：s = "leetcode"
 * 输出："leotcede"
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= s.length <= 3 * 10^5
 * s 由 可打印的 ASCII 字符组成
 * 
 * 
 */

// @lc code=start
class Solution {
    private func isVowel(_ letter: String) -> Bool {
        ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"].contains(letter)
    }
    func reverseVowels(_ s: String) -> String {
        var strings = Array(s)
        var i = 0
        var j = strings.count - 1
        while i < j {
            while i < strings.count, !isVowel(String(strings[i])) {
                i += 1
            }
            while j > 0, !isVowel(String(strings[j])) {
                j -= 1
            }
            if i < j {
                if strings[i] != strings[j] {
                    let temp = strings[i]
                    strings[i] = strings[j] 
                    strings[j] = temp
                }
                i += 1
                j -= 1
            }
        }
        return String(strings)
    }
}
// @lc code=end

let solution = Solution()
print("\(solution.reverseVowels("hello"))")
print("\(solution.reverseVowels("leetcode"))")
