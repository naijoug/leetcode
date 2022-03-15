/*
 * @lc app=leetcode.cn id=41 lang=swift
 *
 * [41] 缺失的第一个正数
 *
 * https://leetcode-cn.com/problems/first-missing-positive/description/
 *
 * algorithms
 * Hard (40.33%)
 * Likes:    891
 * Dislikes: 0
 * Total Accepted:    102.5K
 * Total Submissions: 254.1K
 * Testcase Example:  '[1,2,0]'
 *
 * 给你一个未排序的整数数组，请你找出其中没有出现的最小的正整数。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入: [1,2,0]
 * 输出: 3
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,4,-1,1]
 * 输出: 2
 * 
 * 
 * 示例 3:
 * 
 * 输入: [7,8,9,11,12]
 * 输出: 1
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 你的算法的时间复杂度应为O(n)，并且只能使用常数级别的额外空间。
 * 
 */

// @lc code=start
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var iNums = nums
        let count = iNums.count
        var hasOne = false
        for i in 0..<count {
            guard iNums[i] == 1 else { continue }
            hasOne = true
            break
        }
        guard hasOne else { return 1 }
        for i in 0..<count {
            let num = iNums[i]
            guard num <= 0 || num > count else { continue }
            iNums[i] = 1
        }
        for i in 0..<count {
            let index = abs(iNums[i]) - 1
            if iNums[index] > 0 {
                iNums[index] = -iNums[index]
            }
        }
        for i in 0..<count {
            guard iNums[i] > 0 else { continue }
            return i + 1
        }
        return count + 1
    }
}
// @lc code=end

let solution = Solution()
print(solution.firstMissingPositive([1, 2, 0]))
print(solution.firstMissingPositive([3, 4, -1, 1]))
print(solution.firstMissingPositive([7, 8, 9, 11, 12]))
