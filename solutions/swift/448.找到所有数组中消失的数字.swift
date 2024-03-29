/*
 * @lc app=leetcode.cn id=448 lang=swift
 *
 * [448] 找到所有数组中消失的数字
 *
 * https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array/description/
 *
 * algorithms
 * Easy (61.04%)
 * Likes:    519
 * Dislikes: 0
 * Total Accepted:    66.4K
 * Total Submissions: 108.7K
 * Testcase Example:  '[4,3,2,7,8,2,3,1]'
 *
 * 给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。
 * 
 * 找到所有在 [1, n] 范围之间没有出现在数组中的数字。
 * 
 * 您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。
 * 
 * 示例:
 * 
 * 
 * 输入:
 * [4,3,2,7,8,2,3,1]
 * 
 * 输出:
 * [5,6]
 * 
 * 
 */

// @lc code=start
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var iNums = nums
        for i in 0..<iNums.count {
            let index = abs(iNums[i]) - 1
            if iNums[index] > 0 {
                iNums[index] = -iNums[index]
            }
        }
        var result = [Int]()
        for i in 0..<iNums.count where iNums[i] > 0 {
            result.append(i + 1)
        }
        return result
    }
}
// @lc code=end

/// 暴力解法
class Solution1 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        for i in 1..<nums.count + 1 {
            for j in 0..<nums.count {
                if nums[j] == i {
                    break
                }
                if j == nums.count - 1 {
                    result.append(i)
                }
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.findDisappearedNumbers([4, 3, 2, 7, 8, 2, 3, 1]))
