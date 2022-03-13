/*
 * @lc app=leetcode.cn id=48 lang=swift
 *
 * [48] 旋转图像
 *
 * https://leetcode-cn.com/problems/rotate-image/description/
 *
 * algorithms
 * Medium (73.86%)
 * Likes:    1205
 * Dislikes: 0
 * Total Accepted:    284.8K
 * Total Submissions: 385.6K
 * Testcase Example:  '[[1,2,3],[4,5,6],[7,8,9]]'
 *
 * 给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
 * 
 * 你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 * 输出：[[7,4,1],[8,5,2],[9,6,3]]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
 * 输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * n == matrix.length == matrix[i].length
 * 1 <= n <= 20
 * -1000 <= matrix[i][j] <= 1000
 * 
 * 
 * 
 * 
 */

// @lc code=start
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count-1 {
            for j in i+1..<matrix.count {
                let temp = matrix[j][i]
                matrix[j][i] = matrix[i][j]
                matrix[i][j] = temp
            }
        }
        for i in 0..<matrix.count {
            var nums = matrix[i]
            reverse(&nums)
            matrix[i] = nums
        }
    }
    
    func reverse(_ nums: inout [Int]) {
        for i in 0..<nums.count/2 {
            let temp = nums[nums.count - i - 1]
            nums[nums.count - i - 1] = nums[i]
            nums[i] = temp
        }
    }
}   
// @lc code=end

var matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
var matrix2 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]

var nums1 = [7, 4, 1]
var nums2 = [15, 13, 2, 5]

let solution = Solution()
solution.rotate(&matrix1)
solution.rotate(&matrix2)
print("solution1: \(matrix1)")
print("solution1: \(matrix2)")

solution.reverse(&nums1)
solution.reverse(&nums2)
print("solution1: \(nums1)")
print("solution1: \(nums2)")