/*
 * @lc app=leetcode.cn id=118 lang=swift
 *
 * [118] 杨辉三角
 *
 * https://leetcode-cn.com/problems/pascals-triangle/description/
 *
 * algorithms
 * Easy (69.66%)
 * Likes:    431
 * Dislikes: 0
 * Total Accepted:    142.3K
 * Total Submissions: 204.2K
 * Testcase Example:  '5'
 *
 * 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
 * 
 * 
 * 
 * 在杨辉三角中，每个数是它左上方和右上方的数的和。
 * 
 * 示例:
 * 
 * 输入: 5
 * 输出:
 * [
 * ⁠    [1],
 * ⁠   [1,1],
 * ⁠  [1,2,1],
 * ⁠ [1,3,3,1],
 * ⁠[1,4,6,4,1]
 * ]
 * 
 */

// @lc code=start
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in 0..<numRows {
            var row = Array(repeating: 1, count: i + 1)
            if i > 1 {
                for j in 1..<i {
                    row[j] = result[i - 1][j - 1] + result[i - 1][j]
                }
            }
            result.append(row)
        }
        return result
    }
}
// @lc code=end

let solution = Solution()
print(solution.generate(2))
print(solution.generate(5))
