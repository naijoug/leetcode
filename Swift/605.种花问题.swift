/*
 * @lc app=leetcode.cn id=605 lang=swift
 *
 * [605] 种花问题
 *
 * https://leetcode.cn/problems/can-place-flowers/description/
 *
 * algorithms
 * Easy (32.01%)
 * Likes:    625
 * Dislikes: 0
 * Total Accepted:    187.6K
 * Total Submissions: 585.8K
 * Testcase Example:  '[1,0,0,0,1]\n1'
 *
 * 假设有一个很长的花坛，一部分地块种植了花，另一部分却没有。可是，花不能种植在相邻的地块上，它们会争夺水源，两者都会死去。
 * 
 * 给你一个整数数组 flowerbed 表示花坛，由若干 0 和 1 组成，其中 0 表示没种植花，1 表示种植了花。另有一个数 n
 * ，能否在不打破种植规则的情况下种入 n 朵花？能则返回 true ，不能则返回 false 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：flowerbed = [1,0,0,0,1], n = 1
 * 输出：true
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：flowerbed = [1,0,0,0,1], n = 2
 * 输出：false
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= flowerbed.length <= 2 * 10^4
 * flowerbed[i] 为 0 或 1
 * flowerbed 中不存在相邻的两朵花
 * 0 <= n <= flowerbed.length
 * 
 */

// @lc code=start
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        guard n > 0 else { return true }
        let count = flowerbed.count
        var amount = 0 // 可种花数量
        var i = 0
        var pre = -1 // 上一个种花的位置索引
        while i < count {
            guard flowerbed[i] != 1 else {
                // 有花，则下一个位置不能种花，直接走两个
                i += 2
                continue
            }
            // 没有花
            if i == 0 { 
                // 第一个位置能种花
                if count == 1 {
                    // 只有一个位置，则可以中一棵花
                    amount += 1
                    pre = i
                    i += 2
                } else if flowerbed[1] != 1 {
                    // 后面还有位置，则下一个位置没有花，可以种一棵花
                    amount += 1
                    pre = i
                    i += 2
                } else { // 不种花，走一步
                    i += 1
                }
            } else if i < flowerbed.count - 1 {
                // 中间位置能种花，前一个位置不能种花，没有花，下一个位置没有花
                if i - 1 != pre, flowerbed[i - 1] != 1, flowerbed[i + 1] != 1 {
                    amount += 1
                    pre = i
                    i += 2
                } else {
                    i += 1
                }
            } else {
                // 最后一个位置能种花，上一个位置不能种花，没有花
                if i - 1 >= 0, i - 1 != pre, flowerbed[i - 1] != 1 {
                    amount += 1
                }
                i += 1
            }
            if amount >= n {
                return true
            }
        }
        return amount >= n
    }
}
// @lc code=end

let solution = Solution()
print("result: \(solution.canPlaceFlowers([1,0,0,0,0,1], 2))")
print("result2: \(solution.canPlaceFlowers([0,0,1,0,1], 1))")
print("result3: \(solution.canPlaceFlowers([0,1,0], 1))")
print("result4: \(solution.canPlaceFlowers([0], 1))")
print("result5: \(solution.canPlaceFlowers([0,1,0,1,0,1,0,0], 1))")
print("result6: \(solution.canPlaceFlowers([0,0], 2))")