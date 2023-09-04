/*
 * @lc app=leetcode.cn id=92 lang=swift
 *
 * [92] 反转链表 II
 *
 * https://leetcode-cn.com/problems/reverse-linked-list-ii/description/
 *
 * algorithms
 * Medium (55.14%)
 * Likes:    1190
 * Dislikes: 0
 * Total Accepted:    264.1K
 * Total Submissions: 478.7K
 * Testcase Example:  '[1,2,3,4,5]\n2\n4'
 *
 * 给你单链表的头指针 head 和两个整数 left 和 right ，其中 left  。请你反转从位置 left 到位置 right 的链表节点，返回
 * 反转后的链表 。
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：head = [1,2,3,4,5], left = 2, right = 4
 * 输出：[1,4,3,2,5]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：head = [5], left = 1, right = 1
 * 输出：[5]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 链表中节点数目为 n
 * 1 
 * -500 
 * 1 
 * 
 * 
 * 
 * 
 * 进阶： 你可以使用一趟扫描完成反转吗？
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
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left == 1 else {
            var head = head
            head?.next = reverseBetween(head?.next, left - 1, right - 1)
            return head
        }
        return reverseN(head, right)
    }

    private var node: ListNode?
    private func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }
        guard n > 1 else { 
            node = head.next
            return head 
        }
        let last = reverseN(head.next, n - 1)
        head.next?.next = head
        head.next = node
        return last
    }
}
// @lc code=end

/// 链表节点
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, _ next: ListNode? = nil) { 
        self.val = val
        self.next = next 
    }
}