/*
 * @lc app=leetcode.cn id=206 lang=swift
 *
 * [206] 反转链表
 *
 * https://leetcode-cn.com/problems/reverse-linked-list/description/
 *
 * algorithms
 * Easy (72.75%)
 * Likes:    2361
 * Dislikes: 0
 * Total Accepted:    926.8K
 * Total Submissions: 1.3M
 * Testcase Example:  '[1,2,3,4,5]'
 *
 * 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：head = [1,2,3,4,5]
 * 输出：[5,4,3,2,1]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：head = [1,2]
 * 输出：[2,1]
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：head = []
 * 输出：[]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 链表中节点的数目范围是 [0, 5000]
 * -5000 
 * 
 * 
 * 
 * 
 * 进阶：链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？
 * 
 * 
 * 
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var current = head
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
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
    /**
    通过数组构建单链表
    - Parameter array: 数据数组
    - Parameter pos: 指定有环的位置 (默认: 无环单链表)
    */
    static func buildSingle(_ array: [Int], pos: Int = -1) -> ListNode? {
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

let l1 = ListNode.buildSingle([1,2,3,4,5])

let solution = Solution()
print("l1: \(l1?.log ?? "")")
print("solution1: \(solution.reverseList(l1)?.log ?? "")")