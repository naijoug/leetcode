/*
 * @lc app=leetcode.cn id=442 lang=swift
 *
 * [442] 数组中重复的数据
 *
 * https://leetcode-cn.com/problems/find-all-duplicates-in-an-array/description/
 *
 * algorithms
 * Medium (68.06%)
 * Likes:    316
 * Dislikes: 0
 * Total Accepted:    27.6K
 * Total Submissions: 40.5K
 * Testcase Example:  '[4,3,2,7,8,2,3,1]'
 *
 * 给定一个整数数组 a，其中1 ≤ a[i] ≤ n （n为数组长度）, 其中有些元素出现两次而其他元素出现一次。
 * 
 * 找到所有出现两次的元素。
 * 
 * 你可以不用到任何额外空间并在O(n)时间复杂度内解决这个问题吗？
 * 
 * 示例：
 * 
 * 
 * 输入:
 * [4,3,2,7,8,2,3,1]
 * 
 * 输出:
 * [2,3]
 * 
 * 
 */

// @lc code=start
class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var iNums = nums
        var result = [Int]()
        for i in 0..<iNums.count {
            let index = abs(iNums[i]) - 1
            if iNums[index] > 0 {
                iNums[index] = -iNums[index]
            } else {
                result.append(index + 1)
            }
        }
        return result
    }
}
// @lc code=end

let solution = Solution()
print(solution.findDuplicates([4, 3, 2, 7, 8, 2, 3, 1]))
