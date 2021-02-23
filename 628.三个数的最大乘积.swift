/*
 * @lc app=leetcode.cn id=628 lang=swift
 *
 * [628] 三个数的最大乘积
 *
 * https://leetcode-cn.com/problems/maximum-product-of-three-numbers/description/
 *
 * algorithms
 * Easy (50.06%)
 * Likes:    203
 * Dislikes: 0
 * Total Accepted:    34.8K
 * Total Submissions: 69.6K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一个整型数组，在数组中找出由三个数组成的最大乘积，并输出这个乘积。
 * 
 * 示例 1:
 * 
 * 
 * 输入: [1,2,3]
 * 输出: 6
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: [1,2,3,4]
 * 输出: 24
 * 
 * 
 * 注意:
 * 
 * 
 * 给定的整型数组长度范围是[3,10^4]，数组中所有的元素范围是[-1000, 1000]。
 * 输入的数组中任意三个数的乘积不会超出32位有符号整数的范围。
 * 
 * 
 */

// @lc code=start
class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        guard nums.count > 3 else {
            return nums[0] * nums[1] * nums[2]
        }
        var max = (Int.min, Int.min, Int.min)
        var min = (Int.max, Int.max)
        for num in nums {
            // find third max
            if num > max.0 {
                max.2 = max.1
                max.1 = max.0
                max.0 = num
            } else {
                if num > max.1 {
                    max.2 = max.1
                    max.1 = num
                } else {
                    if num > max.2 {
                        max.2 = num
                    }
                }
            }
            // find second min
            if num < min.0 {
                min.1 = min.0
                min.0 = num
            } else {
                if num < min.1 {
                    min.1 = num
                }
            }
        }
        guard min.1 < 0, 0 < max.0 else {
            return max.0 * max.1 * max.2
        }
        return Swift.max(min.0 * min.1, max.1 * max.2) * max.0
    }
}
// @lc code=end

let solution = Solution()
print(solution.maximumProduct([-100, -98, -1, 2, 3, 4]))
print(solution.maximumProduct([-1, -2, -3, -4]))
