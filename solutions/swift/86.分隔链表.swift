/*
 * @lc app=leetcode.cn id=86 lang=swift
 *
 * [86] 分隔链表
 *
 * https://leetcode-cn.com/problems/partition-list/description/
 *
 * algorithms
 * Medium (60.30%)
 * Likes:    313
 * Dislikes: 0
 * Total Accepted:    67.1K
 * Total Submissions: 110K
 * Testcase Example:  '[1,4,3,2,5,2]\n3'
 *
 * 给你一个链表和一个特定值 x ，请你对链表进行分隔，使得所有小于 x 的节点都出现在大于或等于 x 的节点之前。
 * 
 * 你应当保留两个分区中每个节点的初始相对位置。
 * 
 * 
 * 
 * 示例：
 * 
 * 
 * 输入：head = 1->4->3->2->5->2, x = 3
 * 输出：1->2->2->4->3->5
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let minHead = ListNode(0)
        var min: ListNode? = minHead
        let maxHead = ListNode(0)
        var max: ListNode? = maxHead
        var node = head
        while node != nil {
            guard let n = node  else { break }
            if n.val < x {
                min?.next = ListNode(n.val)
                min = min?.next
            } else {
                max?.next = ListNode(n.val)
                max = max?.next
            }
            node = n.next
        }
        min?.next = maxHead.next
        return minHead.next
    }
}
// @lc code=end

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
extension ListNode {
    var description: String {
        var node = self
        var result = "\(node.val)"
        while node.next != nil {
            guard let next = node.next else { break }
            node = next
            result += "->\(node.val)"
        }
        return result
    }
}

var list = ListNode(1)
list.next = ListNode(4)
list.next?.next = ListNode(3)
list.next?.next?.next = ListNode(2)
list.next?.next?.next?.next = ListNode(5)
list.next?.next?.next?.next?.next = ListNode(2)
print(list.description)
let solution = Solution()
print(solution.partition(list, 3)?.description ?? "")
