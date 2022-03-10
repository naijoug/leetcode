/*
 * @lc app=leetcode.cn id=396 lang=swift
 *
 * [396] 旋转函数
 *
 * https://leetcode-cn.com/problems/rotate-function/description/
 *
 * algorithms
 * Medium (40.50%)
 * Likes:    63
 * Dislikes: 0
 * Total Accepted:    5.6K
 * Total Submissions: 13.9K
 * Testcase Example:  '[]'
 *
 * 给定一个长度为 n 的整数数组 A 。
 * 
 * 假设 Bk 是数组 A 顺时针旋转 k 个位置后的数组，我们定义 A 的“旋转函数” F 为：
 * 
 * F(k) = 0 * Bk[0] + 1 * Bk[1] + ... + (n-1) * Bk[n-1]。
 * 
 * 计算F(0), F(1), ..., F(n-1)中的最大值。
 * 
 * 注意:
 * 可以认为 n 的值小于 10^5。
 * 
 * 示例:
 * 
 * 
 * A = [4, 3, 2, 6]
 * 
 * F(0) = (0 * 4) + (1 * 3) + (2 * 2) + (3 * 6) = 0 + 3 + 4 + 18 = 25
 * F(1) = (0 * 6) + (1 * 4) + (2 * 3) + (3 * 2) = 0 + 4 + 6 + 6 = 16
 * F(2) = (0 * 2) + (1 * 6) + (2 * 4) + (3 * 3) = 0 + 6 + 8 + 9 = 23
 * F(3) = (0 * 3) + (1 * 2) + (2 * 6) + (3 * 4) = 0 + 2 + 12 + 12 = 26
 * 
 * 所以 F(0), F(1), F(2), F(3) 中的最大值是 F(3) = 26 。
 * 
 * 
 */

// @lc code=start
class Solution {
    func maxRotateFunction(_ A: [Int]) -> Int {
        let count = A.count
        guard count > 0 else { return 0 }
        var max = Int.min
        for i in 0..<count {
            var sum = 0
            for j in 0..<count {
                sum += ((i + j) % count) * A[j]
            }
            if sum > max {
                max = sum
            }
        }
        return max
    }
}
// @lc code=end

let solution = Solution()
print(solution.maxRotateFunction([4, 3, 2, 6]))
