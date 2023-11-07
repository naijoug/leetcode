/*
 * @lc app=leetcode.cn id=72 lang=swift
 *
 * [72] 编辑距离
 *
 * https://leetcode-cn.com/problems/edit-distance/description/
 *
 * algorithms
 * Hard (61.87%)
 * Likes:    2252
 * Dislikes: 0
 * Total Accepted:    232K
 * Total Submissions: 374.1K
 * Testcase Example:  '"horse"\n"ros"'
 *
 * 给你两个单词 word1 和 word2， 请返回将 word1 转换成 word2 所使用的最少操作数  。
 * 
 * 你可以对一个单词进行如下三种操作：
 * 
 * 
 * 插入一个字符
 * 删除一个字符
 * 替换一个字符
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：word1 = "horse", word2 = "ros"
 * 输出：3
 * 解释：
 * horse -> rorse (将 'h' 替换为 'r')
 * rorse -> rose (删除 'r')
 * rose -> ros (删除 'e')
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：word1 = "intention", word2 = "execution"
 * 输出：5
 * 解释：
 * intention -> inention (删除 't')
 * inention -> enention (将 'i' 替换为 'e')
 * enention -> exention (将 'n' 替换为 'x')
 * exention -> exection (将 'n' 替换为 'c')
 * exection -> execution (插入 'u')
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 <= word1.length, word2.length <= 500
 * word1 和 word2 由小写英文字母组成
 * 
 * 
 */

// @lc code=start
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let char1s = [Character](word1)
        let char2s = [Character](word2)

        let count1 = char1s.count
        let count2 = char2s.count
        var cache = [[Int]](repeating: [Int](repeating: 0, count: count2), count: count1)
        for i in 0..<count1 {
            for j in 0..<count2 {
                
            }
        }
        
        return cache[char1s.count - 1][char2s.count - 1] ?? 0
    }
}
// @lc code=end

class Solution1 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let char1s = [Character](word1)
        let char2s = [Character](word2)

        var cache = [[Int?]](repeating: [Int?](repeating: nil, count: char2s.count), count: char1s.count)

        func dp(i: Int, j: Int) -> Int {
            if i == -1 { return j + 1 }
            if j == -1 { return i + 1 }
            if let value = cache[i][j] { return value }
            
            let value = char1s[i] == char2s[j] ?
                dp(i: i - 1, j: j - 1)
                :
                min(
                    dp(i: i - 1, j: j) + 1,     // 删除一个字符
                    dp(i: i - 1, j: j - 1) + 1, // 替换一个字符 
                    dp(i: i, j: j - 1) + 1      // 增加一个字符
                )
            cache[i][j] = value
            return value
        }

        return dp(i: char1s.count - 1, j: char2s.count - 1)
    }
}

let solution = Solution()
print(solution.minDistance("horse", "ros"))
print(solution.minDistance("intention", "execution"))