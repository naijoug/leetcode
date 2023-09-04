/*
 * @lc app=leetcode id=1 lang=swift
 *
 * [1] Two Sum
 *
 * https://leetcode.com/problems/two-sum/description/
 *
 * algorithms
 * Easy (44.53%)
 * Likes:    11863
 * Dislikes: 409
 * Total Accepted:    2.1M
 * Total Submissions: 4.8M
 * Testcase Example:  '[2,7,11,15]\n9'
 *
 * Given an array of integers, return indices of the two numbers such that they
 * add up to a specific target.
 * 
 * You may assume that each input would have exactly one solution, and you may
 * not use the same element twice.
 * 
 * Example:
 * 
 * 
 * Given nums = [2, 7, 11, 15], target = 9,
 * 
 * Because nums[0] + nums[1] = 2 + 7 = 9,
 * return [0, 1].
 * 
 * 
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            let num = nums[i]
            if let j = map[target - num] {
                return [j, i]
            }
            map[num] = i
        }
        return []
    }
}
// @lc code=end

let solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))
