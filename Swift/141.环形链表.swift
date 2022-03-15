/*
 * @lc app=leetcode.cn id=141 lang=swift
 *
 * [141] 环形链表
 *
 * https://leetcode-cn.com/problems/linked-list-cycle/description/
 *
 * algorithms
 * Easy (51.37%)
 * Likes:    1395
 * Dislikes: 0
 * Total Accepted:    660.2K
 * Total Submissions: 1.3M
 * Testcase Example:  '[3,2,0,-4]\n1'
 *
 * 给你一个链表的头节点 head ，判断链表中是否有环。
 * 
 * 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos
 * 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。
 * 
 * 如果链表中存在环 ，则返回 true 。 否则，返回 false 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 
 * 
 * 输入：head = [3,2,0,-4], pos = 1
 * 输出：true
 * 解释：链表中有一个环，其尾部连接到第二个节点。
 * 
 * 
 * 示例 2：
 * 
 * 
 * 
 * 
 * 输入：head = [1,2], pos = 0
 * 输出：true
 * 解释：链表中有一个环，其尾部连接到第一个节点。
 * 
 * 
 * 示例 3：
 * 
 * 
 * 
 * 
 * 输入：head = [1], pos = -1
 * 输出：false
 * 解释：链表中没有环。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 链表中节点的数目范围是 [0, 10^4]
 * -10^5 <= Node.val <= 10^5
 * pos 为 -1 或者链表中的一个 有效索引 。
 * 
 * 
 * 
 * 
 * 进阶：你能用 O(1)（即，常量）内存解决此问题吗？
 * 
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            guard fast === slow else { continue }
            return true
        }
        return false
    }
}
// @lc code=end

/// 链表节点
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0 }
    public init(_ val: Int) { self.val = val }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}
extension ListNode {
    /// 通过数组构建链表
    static func build(_ array: [Int], pos: Int = -1) -> ListNode? {
        guard !array.isEmpty else { return nil }
        let dummy = ListNode()
        var p = dummy
        var circle: ListNode?
        for i in 0..<array.count {
            let node = ListNode(array[i])
            if i == pos { circle = node }
            p.next = node
            p = node
        }
        if let node = circle {
            p.next = node
        }
        return dummy.next
    }
}
extension ListNode {
    /// 打印链表数据
    var log: String {
        var msg = "\(val)"
        var p: ListNode? = self.next
        while let val = p?.val {
            msg += "->\(val)"
            p = p?.next
        }
        return msg
    }
}

let l1 = ListNode.build([3, 2, 0, 4], pos: 1)
// print("l1: \(l1?.log ?? "")")

let solution = Solution()
print("\(solution.hasCycle(l1))")