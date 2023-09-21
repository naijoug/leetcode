/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 *
 * https://leetcode-cn.com/problems/move-zeroes/description/
 *
 * algorithms
 * Easy (63.52%)
 * Likes:    896
 * Dislikes: 0
 * Total Accepted:    287.3K
 * Total Submissions: 452.4K
 * Testcase Example:  '[0,1,0,3,12]'
 *
 * 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 * 
 * 示例:
 * 
 * 输入: [0,1,0,3,12]
 * 输出: [1,3,12,0,0]
 * 
 * 说明:
 * 
 * 
 * 必须在原数组上操作，不能拷贝额外的数组。
 * 尽量减少操作次数。
 * 
 * 
 */

// @lc code=start
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var j = 0
        while j < nums.count {
            guard nums[j] != 0 else { 
                j += 1
                continue 
            }
            if i != j {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
            }
            i += 1
            j += 1
        }
    }
}
// @lc code=end

class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        var index = -1
        for i in 0..<nums.count {
            guard index >= 0 else {
                guard nums[i] == 0 else { continue }
                index = i
                continue
            }
            guard nums[i] != 0 else { continue }
            nums[index] = nums[i]
            nums[i] = 0
            index += 1
        }
    }
}

// var nums = [0,1,0,3,12]
// var nums = [1]
var nums = [2,1]
// swiftlint:disable line_length
// var nums = [-959151711,623836953,209446690,-1950418142,1339915067,-733626417,481171539,-2125997010,-1225423476,1462109565,147434687,-1800073781,-1431212205,-450443973,50097298,753533734,-747189404,-2070885638,0,-1484353894,-340296594,-2133744570,619639811,-1626162038,669689561,0,112220218,502447212,-787793179,0,-726846372,-1611013491,204107194,1605165582,-566891128,2082852116,0,532995238,-1502590712,0,2136989777,-2031153343,371398938,-1907397429,342796391,609166045,-2007448660,-1096076344,-323570318,0,-2082980371,2129956379,-243553361,-1549960929,1502383415,0,-1394618779,694799815,78595689,-1439173023,-1416578800,685225786,-333502212,-1181308536,-380569313,772035354,0,-915266376,663709718,1443496021,-777017729,-883300731,-387828385,1907473488,-725483724,-972961871,-1255712537,383120918,1383877998,1722751914,0,-1156050682,1952527902,-560244497,1304305692,1173974542,-1313227247,-201476579,-298899493,-1828496581,-1724396350,1933643204,1531804925,1728655262,-955565449,0,-69843702,-461760848,268336768,1446130876]
let solution = Solution()
solution.moveZeroes(&nums)
print(nums)
