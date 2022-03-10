/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
 *
 * https://leetcode-cn.com/problems/merge-two-sorted-lists/description/
 *
 * algorithms
 * Easy (58.62%)
 * Likes:    761
 * Dislikes: 0
 * Total Accepted:    154K
 * Total Submissions: 262.2K
 * Testcase Example:  '[1,2,4]\n[1,3,4]'
 *
 * 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 
 * 
 * 示例：
 * 
 * 输入：1->2->4, 1->3->4
 * 输出：1->1->2->3->4->4
 * 
 * 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else {
            return l1 ?? l2
        }
        let head = ListNode(0)
        var p: ListNode? = head
        var op1: ListNode? = l1
        var op2: ListNode? = l2
        while let p1 = op1, let p2 = op2 {
            if p1.val <= p2.val {
                p?.next = p1
                op1 = op1?.next
            } else {
                p?.next = p2
                op2 = op2?.next
            }
            p = p?.next
        }
        if let p1 = op1 {
            p?.next = p1
        }
        if let p2 = op2 {
            p?.next = p2
        }
        return head.next
    }
}
// @lc code=end

extension ListNode {
    var log: String {
        var msg = "\(val)"
        var p: ListNode? = self
        while p?.next != nil {
            if let val = p?.next?.val {
                msg += "->\(val)"
            }
            p = p?.next
        }
        return msg
    }
}

let l1 = ListNode(1)
l1.next = ListNode(2)
l1.next?.next = ListNode(4)

let l2 = ListNode(1)
l2.next = ListNode(3)
l2.next?.next = ListNode(4)

let solution = Solution()
print("l1: \(l1.log)")
print("l2: \(l2.log)")
print("merge: \(solution.mergeTwoLists(l1, l2)?.log ?? "")")
