/*
 * @lc app=leetcode.cn id=567 lang=swift
 *
 * [567] 字符串的排列
 *
 * https://leetcode-cn.com/problems/permutation-in-string/description/
 *
 * algorithms
 * Medium (43.62%)
 * Likes:    604
 * Dislikes: 0
 * Total Accepted:    164.6K
 * Total Submissions: 377.1K
 * Testcase Example:  '"ab"\n"eidbaooo"'
 *
 * 给你两个字符串 s1 和 s2 ，写一个函数来判断 s2 是否包含 s1 的排列。如果是，返回 true ；否则，返回 false 。
 * 
 * 换句话说，s1 的排列之一是 s2 的 子串 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：s1 = "ab" s2 = "eidbaooo"
 * 输出：true
 * 解释：s2 包含 s1 的排列之一 ("ba").
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：s1= "ab" s2 = "eidboaoo"
 * 输出：false
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= s1.length, s2.length <= 10^4
 * s1 和 s2 仅包含小写字母
 * 
 * 
 */

// @lc code=start
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let char1s = [Character](s1)
        let char2s = [Character](s2)
        var needs = [Character: Int]()
        for char in char1s {
            needs[char] = (needs[char] ?? 0) + 1
        }
        func isOk() -> Bool {
            !needs.values.contains(where: { $0 > 0 })
        }
        var start = 0
        var end = 0
        while end < char2s.count {
            let char = char2s[end]
            if needs.keys.contains(char) {
                needs[char] = (needs[char] ?? 0) - 1
            }
            end += 1
            guard isOk() else { continue }
            while isOk(), start < end {
                guard end - start == char1s.count else {
                    let char = char2s[start]
                    if needs.keys.contains(char) {
                        needs[char] = (needs[char] ?? 0) + 1
                    }
                    start += 1
                    continue
                }
                return true
            }
        }
        return false
    }
}
// @lc code=end

class Solution1 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let count1 = s1.count
        let count2 = s2.count
        guard count1 <= count2 else { return false }
        let matchDict = permute(s1)
        let chars = [Character](s2)
        for i in 0..<(count2 - count1 + 1) {
            let substring = String(chars[i..<(i + count1)])
            print(substring)
            guard matchDict[substring] ?? false else { continue }
            return true
        }
        return false
    }
    private func permute(_ str: String) -> [String: Bool] {
        var matchDict = [String: Bool]()
        func permute(_ chars: [Character], track: [Character] = [], used: [Int: Bool] = [:]) {
            guard track.count < chars.count else {
                matchDict[String(track)] = true
                return
            }
            var track = track
            var used = used
            for i in 0..<chars.count {
                guard !(used[i] ?? false) else { continue }
                let char = chars[i]
                used[i] = true
                track.append(char)
                permute(chars, track: track, used: used)
                track.removeLast()
                used[i] = false
            }
        }
        permute([Character](str))
        print(matchDict)
        return matchDict
    }
}

let solution = Solution()
print(solution.checkInclusion("ab", "eidbaooo"))
print(solution.checkInclusion("adc", "dcda"))
print(solution.checkInclusion("horse", "ros"))
print(solution.checkInclusion("algorithm", "altruistic"))