/*
 * @lc app=leetcode.cn id=354 lang=swift
 *
 * [354] 俄罗斯套娃信封问题
 *
 * https://leetcode-cn.com/problems/russian-doll-envelopes/description/
 *
 * algorithms
 * Hard (44.55%)
 * Likes:    687
 * Dislikes: 0
 * Total Accepted:    80.7K
 * Total Submissions: 184.1K
 * Testcase Example:  '[[5,4],[6,4],[6,7],[2,3]]'
 *
 * 给你一个二维整数数组 envelopes ，其中 envelopes[i] = [wi, hi] ，表示第 i 个信封的宽度和高度。
 * 
 * 当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。
 * 
 * 请计算 最多能有多少个 信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。
 * 
 * 注意：不允许旋转信封。
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：envelopes = [[5,4],[6,4],[6,7],[2,3]]
 * 输出：3
 * 解释：最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。
 * 
 * 示例 2：
 * 
 * 
 * 输入：envelopes = [[1,1],[1,1],[1,1]]
 * 输出：1
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= envelopes.length <= 10^5
 * envelopes[i].length == 2
 * 1 <= wi, hi <= 10^5
 * 
 * 
 */

// @lc code=start
class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let heights = envelopes.sorted(by: { item1, item2 in
            item1[0] == item2[0] ? (item1[1] >= item2[1]) : (item1[0] < item2[0])
        }).map({ $0[1] })

        var dp = [Int](repeating: 1, count: heights.count)
        for i in 0..<heights.count {
            var dp_i_1 = 0
            for j in 0..<i {
                guard heights[i] > heights[j] else { continue }
                dp_i_1 = max(dp_i_1, dp[j])
            }
            dp[i] = dp_i_1 + 1
        }
        return dp.max() ?? 1
    }
}
// @lc code=end

let solution = Solution()
print(solution.maxEnvelopes([[5,4],[6,4],[6,7],[2,3]]))