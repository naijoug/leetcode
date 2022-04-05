/*
 * @lc app=leetcode.cn id=76 lang=swift
 *
 * [76] 最小覆盖子串
 *
 * https://leetcode-cn.com/problems/minimum-window-substring/description/
 *
 * algorithms
 * Hard (43.54%)
 * Likes:    1695
 * Dislikes: 0
 * Total Accepted:    246.5K
 * Total Submissions: 565.5K
 * Testcase Example:  '"ADOBECODEBANC"\n"ABC"'
 *
 * 给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 ""
 * 。
 * 
 * 
 * 
 * 注意：
 * 
 * 
 * 对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。
 * 如果 s 中存在这样的子串，我们保证它是唯一的答案。
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：s = "ADOBECODEBANC", t = "ABC"
 * 输出："BANC"
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：s = "a", t = "a"
 * 输出："a"
 * 
 * 
 * 示例 3:
 * 
 * 
 * 输入: s = "a", t = "aa"
 * 输出: ""
 * 解释: t 中两个字符 'a' 均应包含在 s 的子串中，
 * 因此没有符合条件的子字符串，返回空字符串。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * s 和 t 由英文字母组成
 * 
 * 
 * 
 * 进阶：你能设计一个在 o(n) 时间内解决此问题的算法吗？
 */

// @lc code=start
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let schars = [Character](s)
        let tchars = [Character](t)
        let scount = schars.count
        let tcount = tchars.count
        guard tcount <= scount else { return "" }
        
        var need = [Character: Int]()
        for char in tchars {
            need[char] = (need[char] ?? 0) + 1
        }

        func isValid() -> Bool {
            !need.values.contains(where: { $0 > 0 })
        }
        
        var start: Int = 0
        var count: Int = 0

        var i = 0
        var j = 0
        while i < scount {
            let ichar = schars[i]
            if need.keys.contains(ichar) {
                need[ichar] = (need[ichar] ?? 0) - 1
            }
            i += 1
            guard isValid() else { continue }
            while j < i {
                let jchar = schars[j]
                if need.keys.contains(jchar) {
                    need[jchar] = min(1, (need[jchar] ?? 0) + 1)
                }
                j += 1
                guard !isValid() else { continue }
                if count == 0 || count > (i - j) {
                    start = j - 1
                    count = i - j + 1
                }
                break
            }
        }
        guard count > 0 else { return "" }
        return String(schars[start..<(start + count)])
    }
}
// @lc code=end

class Solution1 {
    func minWindow(_ s: String, _ t: String) -> String {
        let schars = [Character](s)
        let tchars = [Character](t)
        let scount = schars.count
        let tcount = tchars.count
        guard tcount <= scount else { return "" }
        
        var need = [Character: Int]()
        for char in schars {
            need[char] = 0
        }
        for char in tchars {
            need[char] = (need[char] ?? 0) + 1
        }
        var needCount = tcount

        var start: Int = 0
        var count: Int = .max

        var i = 0
        var j = 0
        while i < scount {
            let ichar = schars[i]
            if need[ichar] ?? 0 > 0 {
                needCount -= 1
            }
            need[ichar] = (need[ichar] ?? 0) - 1
            while needCount == 0 {
                if count > (i - j + 1) {
                    start = j
                    count = i - j + 1
                }

                let jchar = schars[j]
                if need[jchar] ?? 0 >= 0 {
                    needCount += 1
                }
                need[jchar] = (need[jchar] ?? 0) + 1
                j += 1
            }
            i += 1
        }
        return count == .max ? "" : String(schars[start..<(start + count)])
    }
}

let solution = Solution()
print(solution.minWindow("ADOBECODEBANC", "ABC"))
// print(solution.minWindow("a", "a"))
// print(solution.minWindow("ab", "a"))
// print(solution.minWindow("aa", "aa"))