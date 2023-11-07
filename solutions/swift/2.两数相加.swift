/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
 *
 * https://leetcode-cn.com/problems/add-two-numbers/description/
 *
 * algorithms
 * Medium (36.14%)
 * Likes:    3533
 * Dislikes: 0
 * Total Accepted:    275.2K
 * Total Submissions: 761.1K
 * Testcase Example:  '[2,4,3]\n[5,6,4]'
 *
 * 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 * 
 * 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 * 
 * 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 * 
 * 示例：
 * 
 * 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 * 输出：7 -> 0 -> 8
 * 原因：342 + 465 = 807
 * 
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var left = l1
        var right = l2
        let head = ListNode(0)
        var result: ListNode? = head
        var carry = 0
        var sum = 0
        while ( left != nil && right != nil ) {
            sum = (left?.val ?? 0) + (right?.val ?? 0) + carry
            result?.next = ListNode(sum % 10)
            result = result?.next
            carry = sum / 10
            left = left?.next
            right = right?.next
        }
        while ( left != nil ) {
            sum = (left?.val ?? 0) + carry
            result?.next = ListNode(sum % 10)
            result = result?.next
            carry = sum / 10
            left = left?.next
        }
        while ( right != nil ) {
            sum = (right?.val ?? 0) + carry
            result?.next = ListNode(sum % 10)
            result = result?.next
            carry = sum / 10
            right = right?.next
        }
        if (carry > 0) {
            result?.next = ListNode(carry)
        }
        return head.next
    }
}
// @lc code=end


let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)
let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)
printList(l1)
printList(l2)

let solution = Solution()
printList(solution.addTwoNumbers(l1, l2))
