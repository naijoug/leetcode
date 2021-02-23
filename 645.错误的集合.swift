/*
 * @lc app=leetcode.cn id=645 lang=swift
 *
 * [645] 错误的集合
 *
 * https://leetcode-cn.com/problems/set-mismatch/description/
 *
 * algorithms
 * Easy (42.38%)
 * Likes:    138
 * Dislikes: 0
 * Total Accepted:    27.1K
 * Total Submissions: 64K
 * Testcase Example:  '[1,2,2,4]'
 *
 * 集合 S 包含从1到 n
 * 的整数。不幸的是，因为数据错误，导致集合里面某一个元素复制了成了集合里面的另外一个元素的值，导致集合丢失了一个整数并且有一个元素重复。
 * 
 * 给定一个数组 nums 代表了集合 S 发生错误后的结果。你的任务是首先寻找到重复出现的整数，再找到丢失的整数，将它们以数组的形式返回。
 * 
 * 示例 1:
 * 
 * 
 * 输入: nums = [1,2,2,4]
 * 输出: [2,3]
 * 
 * 
 * 注意:
 * 
 * 
 * 给定数组的长度范围是 [2, 10000]。
 * 给定的数组是无序的。
 * 
 * 
 */

// @lc code=start
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var map = Array(repeating: 0, count: nums.count + 1)
        for num in nums {
            map[num] += 1
        }
        var result = [0, 0]
        for i in 1..<map.count {
            switch map[i] {
            case 0:
                if result[0] > 0 {
                    return [result[0], i]
                }
                result[1] = i
            case 2:
                if result[1] > 0 {
                    return [i, result[1]]
                }
                result[0] = i
            default:
                continue
            }
        }
        return result
    }
}
// @lc code=end

let solution = Solution()
print(solution.findErrorNums([1, 2, 2, 4]))
print(solution.findErrorNums([1, 1]))
print(solution.findErrorNums([3, 2, 2]))
print(solution.findErrorNums([3, 2, 3, 4, 6, 5]))
