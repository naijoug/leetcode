/*
 * @lc app=leetcode.cn id=698 lang=swift
 *
 * [698] 划分为k个相等的子集
 *
 * https://leetcode-cn.com/problems/partition-to-k-equal-sum-subsets/description/
 *
 * algorithms
 * Medium (43.34%)
 * Likes:    519
 * Dislikes: 0
 * Total Accepted:    40.7K
 * Total Submissions: 95.3K
 * Testcase Example:  '[4,3,2,3,5,2,1]\n4'
 *
 * 给定一个整数数组  nums 和一个正整数 k，找出是否有可能把这个数组分成 k 个非空子集，其总和都相等。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入： nums = [4, 3, 2, 3, 5, 2, 1], k = 4
 * 输出： True
 * 说明： 有可能将其分成 4 个子集（5），（1,4），（2,3），（2,3）等于总和。
 * 
 * 示例 2:
 * 
 * 
 * 输入: nums = [1,2,3,4], k = 3
 * 输出: false
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= k <= len(nums) <= 16
 * 0 < nums[i] < 10000
 * 每个元素的频率在 [1,4] 范围内
 * 
 * 
 */

// @lc code=start
class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0, +)
        guard sum > 0, k > 0, sum % k == 0 else { return false }
        let target = sum / k
        var buckets = [Int](repeating: 0, count: k)
        let nums = nums.sorted(by: { $0 > $1 })
        var used = [Int: Bool]()
        
        for i in 0..<buckets.count {
            print("装第 \(i) 个桶")
            for j in 0..<nums.count {
                guard nums[j] <= target else { return false }
                guard !(used[j] ?? false) else { continue }
                guard buckets[i] + nums[j] <= target else { continue }
                print("     \(buckets[i]) 装入 \(j) - \(nums[j]) | \(buckets[i] + nums[j])")
                buckets[i] += nums[j]
                used[j] = true
                guard buckets[i] == target else { continue }
                break
            }
        }
        print("target: \(target) | nums: \(nums) | buckets: \(buckets) | used: \(used)")
        return !buckets.contains(where: { $0 != target })
    }
}
// @lc code=end

class Solution2 {
    private var target: Int = 0
    private var buckets = [Int]()
    private var nums = [Int]()
    private var used = [Int: Bool]()
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0, +)
        guard sum > 0, k > 0, sum % k == 0 else { return false }
        target = sum / k
        buckets = [Int](repeating: 0, count: k)
        self.nums = nums.sorted(by: { $0 > $1 })
        used = [:]
        return backtrack(0, start: 0)
    }
    
    private func backtrack(_ index: Int, start: Int) -> Bool {
        guard index < buckets.count else {
            return !buckets.contains(where: { $0 != target })
        }
        if buckets[index] == target {
            return backtrack(index + 1, start: 0)
        }
        for i in 0..<nums.count {
            guard nums[i] <= target else { return false }
            guard !(used[i] ?? false) else { continue }
            guard buckets[index] + nums[i] <= target else { return false }
            used[i] = true
            buckets[index] += nums[i]
            if backtrack(index, start: i + 1) { return true }
            buckets[index] -= nums[i]
            used[i] = false
        }
        return false
    }
}

class Solution1 {
    private var target: Int = 0
    private var buckets = [Int]()
    private var nums = [Int]()
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0, +)
        guard sum > 0, k > 0, sum % k == 0 else { return false }
        target = sum / k
        buckets = [Int](repeating: 0, count: k)
        self.nums = nums.sorted(by: { $0 > $1 })
        return backtrack(0)
    }
    private func backtrack(_ index: Int) -> Bool {
        guard index < nums.count else { 
            return !buckets.contains(where: { $0 != target })
        }
        guard nums[index] <= target else { return false }
        for i in 0..<buckets.count {
            guard buckets[i] + nums[index] <= target else { continue }
            buckets[i] += nums[index]
            if backtrack(index + 1) { return true }
            buckets[i] -= nums[index]
            // 如果一个数字无法装进去，这表明不能等分
            guard buckets[i] == 0 else { continue }
            return false
        }
        return false
    }
}

print("solution:")
let solution = Solution()
print(solution.canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1], 4))
print(solution.canPartitionKSubsets([960,3787,1951,5450,4813,752,1397,801,1990,1095,3643,8133,893,5306,8341,5246], 6))
print(solution.canPartitionKSubsets([10,1,10,9,6,1,9,5,9,10,7,8,5,2,10,8], 11))

print("solution2:")
let solution2 = Solution2()
print(solution2.canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1], 4))
print(solution2.canPartitionKSubsets([960,3787,1951,5450,4813,752,1397,801,1990,1095,3643,8133,893,5306,8341,5246], 6))
print(solution2.canPartitionKSubsets([10,1,10,9,6,1,9,5,9,10,7,8,5,2,10,8], 11))

print("solution1:")
let solution1 = Solution1()
print(solution1.canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1], 4))
print(solution1.canPartitionKSubsets([960,3787,1951,5450,4813,752,1397,801,1990,1095,3643,8133,893,5306,8341,5246], 6))
print(solution1.canPartitionKSubsets([10,1,10,9,6,1,9,5,9,10,7,8,5,2,10,8], 11))