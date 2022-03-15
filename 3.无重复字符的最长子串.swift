/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 *
 * https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/description/
 *
 * algorithms
 * Medium (36.11%)
 * Likes:    4789
 * Dislikes: 0
 * Total Accepted:    782.8K
 * Total Submissions: 2.2M
 * Testcase Example:  '"abcabcbb"'
 *
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 
 * 输入: s = "abcabcbb"
 * 输出: 3 
 * 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: s = "bbbbb"
 * 输出: 1
 * 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 * 
 * 
 * 示例 3:
 * 
 * 
 * 输入: s = "pwwkew"
 * 输出: 3
 * 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 * 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 * 
 * 
 * 示例 4:
 * 
 * 
 * 输入: s = ""
 * 输出: 0
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 
 * s 由英文字母、数字、符号和空格组成
 * 
 * 
 */

// @lc code=start
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = [Character](s)
        var window = [Character: Int]()
        var left = 0
        var right = 0
        var res = 0
        while right < chars.count {
            let rightChar = chars[right]
            right += 1
            window[rightChar] = (window[rightChar] ?? 0) + 1
            while window[rightChar] ?? 0 > 1 {
                let leftChar = chars[left]
                left += 1
                window[leftChar] = (window[leftChar] ?? 0) - 1
            }
            res = max(res, right - left)
        }
        return res
    }
}
// @lc code=end

let s1 = "abcabcbb" // 3
let s2 = "bbbbb"    // 1
let s3 = "pwwkew"   // 3
let s4 = ""

let solution = Solution()
print("solution1: \(solution.lengthOfLongestSubstring(s1))")
print("solution2: \(solution.lengthOfLongestSubstring(s2))")
print("solution3: \(solution.lengthOfLongestSubstring(s3))")
print("solution4: \(solution.lengthOfLongestSubstring(s4))")