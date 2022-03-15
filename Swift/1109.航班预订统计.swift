/*
 * @lc app=leetcode.cn id=1109 lang=swift
 *
 * [1109] 航班预订统计
 *
 * https://leetcode-cn.com/problems/corporate-flight-bookings/description/
 *
 * algorithms
 * Medium (59.67%)
 * Likes:    323
 * Dislikes: 0
 * Total Accepted:    71.5K
 * Total Submissions: 119.7K
 * Testcase Example:  '[[1,2,10],[2,3,20],[2,5,25]]\n5'
 *
 * 这里有 n 个航班，它们分别从 1 到 n 进行编号。
 * 
 * 有一份航班预订表 bookings ，表中第 i 条预订记录 bookings[i] = [firsti, lasti, seatsi] 意味着在从
 * firsti 到 lasti （包含 firsti 和 lasti ）的 每个航班 上预订了 seatsi 个座位。
 * 
 * 请你返回一个长度为 n 的数组 answer，里面的元素是每个航班预定的座位总数。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：bookings = [[1,2,10],[2,3,20],[2,5,25]], n = 5
 * 输出：[10,55,45,25,25]
 * 解释：
 * 航班编号        1   2   3   4   5
 * 预订记录 1 ：   10  10
 * 预订记录 2 ：       20  20
 * 预订记录 3 ：       25  25  25  25
 * 总座位数：      10  55  45  25  25
 * 因此，answer = [10,55,45,25,25]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：bookings = [[1,2,10],[2,2,15]], n = 2
 * 输出：[10,25]
 * 解释：
 * 航班编号        1   2
 * 预订记录 1 ：   10  10
 * 预订记录 2 ：       15
 * 总座位数：      10  25
 * 因此，answer = [10,25]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= n <= 2 * 10^4
 * 1 <= bookings.length <= 2 * 10^4
 * bookings[i].length == 3
 * 1 <= firsti <= lasti <= n
 * 1 <= seatsi <= 10^4
 * 
 * 
 */

// @lc code=start
class Solution {

    class Diff {
        private var diffNums: [Int]
        init(_ nums: [Int]) {
            var diffNums = [Int](repeating: 0, count: nums.count)
            for i in 0..<nums.count {
                guard i > 0 else { 
                    diffNums[0] = nums[i]
                    continue
                }
                diffNums[i] = nums[i] - nums[i - 1]
            }
            self.diffNums = diffNums
        }
        
        func increment(i: Int, j: Int, val: Int) {
            diffNums[i] += val
            guard j + 1 < diffNums.count else { return }
            diffNums[j + 1] -= val
        }

        var nums: [Int] {
            var nums = [Int](repeating: 0, count: diffNums.count) 
            for i in 0..<diffNums.count {
                guard i > 0 else {
                    nums[0] = diffNums[0]
                    continue
                }
                nums[i] = nums[i - 1] + diffNums[i]
            }
            return nums
        }
    }

    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        let diff = Diff([Int](repeating: 0, count: n))
        for booking in bookings {
            diff.increment(i: booking[0] - 1, j: booking[1] - 1, val: booking[2])
        }
        return diff.nums
    }
}
// @lc code=end

let bookings1 = [[1,2,10],[2,3,20],[2,5,25]] // 5 -> [10,55,45,25,25]
let bookings2 = [[1,2,10],[2,2,15]] // 2 -> [10,25]
let solution = Solution()
print("solution1: \(solution.corpFlightBookings(bookings1, 5))")
print("solution2: \(solution.corpFlightBookings(bookings2, 2))")