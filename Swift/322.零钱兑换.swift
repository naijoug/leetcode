/*
 * @lc app=leetcode.cn id=322 lang=swift
 *
 * [322] 零钱兑换
 *
 * https://leetcode-cn.com/problems/coin-change/description/
 *
 * algorithms
 * Medium (42.21%)
 * Likes:    1007
 * Dislikes: 0
 * Total Accepted:    168.9K
 * Total Submissions: 399.9K
 * Testcase Example:  '[1,2,5]\n11'
 *
 * 给定不同面额的硬币 coins 和一个总金额
 * amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 * 
 * 你可以认为每种硬币的数量是无限的。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：coins = [1, 2, 5], amount = 11
 * 输出：3 
 * 解释：11 = 5 + 5 + 1
 * 
 * 示例 2：
 * 
 * 
 * 输入：coins = [2], amount = 3
 * 输出：-1
 * 
 * 示例 3：
 * 
 * 
 * 输入：coins = [1], amount = 0
 * 输出：0
 * 
 * 
 * 示例 4：
 * 
 * 
 * 输入：coins = [1], amount = 1
 * 输出：1
 * 
 * 
 * 示例 5：
 * 
 * 
 * 输入：coins = [1], amount = 2
 * 输出：2
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * 1 
 * 0 
 * 
 * 
 */

// @lc code=start
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        self.coins = coins.sorted(by: { $0 > $1 })
        self.cache = [0: 0]
        return backtrack(amount)
    }
    private var coins = [Int]()
    private var cache = [Int: Int]()
    private func backtrack(_ amount: Int) -> Int {
        if let count = cache[amount] { return count }
        
        var minCount: Int = Int.max
        for coin in coins {
            guard coin > 0, amount - coin >= 0 else { continue }
            let count = backtrack(amount - coin)
            guard count != -1 else { continue }
            cache[amount - coin] = count
            minCount = min(minCount, count)
        }
        cache[amount] = minCount == Int.max ? -1 : (minCount + 1)
        return cache[amount] ?? -1
    }
}
// @lc code=end


class Solution1 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        let sortCoins = coins.sorted(by: { $0 > $1 })
        var count = 0
        var balance = amount
        while balance > 0 {
            for i in 0..<sortCoins.count {
                let coin = sortCoins[i]
                guard balance - coin >= 0 else {
                    guard i == sortCoins.count - 1 else { continue }
                    return -1
                }
                balance -= coin
                count += 1
                print("balance: \(balance) | coin: \(coin) | count: \(count)")
                guard balance == 0 else { break }
                return count
            }
        }
        return -1
    }
}

let solution = Solution()
// print(solution.coinChange([1, 2, 5], 11))
// print(solution.coinChange([2], 3))
// print(solution.coinChange([1], 0))
// print(solution.coinChange([1], 1))
// print(solution.coinChange([1], 2))
// print(solution.coinChange([2, 5, 10, 1], 27))
print(solution.coinChange([186, 419, 83, 408], 6249)) // 20

// let solution1 = Solution1()
// print(solution.coinChange([1, 2, 5], 11))
// print(solution.coinChange([2], 3))
// print(solution.coinChange([1], 0))
// print(solution.coinChange([1], 1))
// print(solution.coinChange([1], 2))
// print(solution.coinChange([2, 5, 10, 1], 27))
// print(solution1.coinChange([186, 419, 83, 408], 6249))
