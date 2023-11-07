/*
 * @lc app=leetcode.cn id=19 lang=swift
 *
 * [19] 删除链表的倒数第 N 个结点
 *
 * https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/description/
 *
 * algorithms
 * Medium (43.65%)
 * Likes:    1855
 * Dislikes: 0
 * Total Accepted:    687.3K
 * Total Submissions: 1.6M
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：head = [1,2,3,4,5], n = 2
 * 输出：[1,2,3,5]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：head = [1], n = 1
 * 输出：[]
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：head = [1,2], n = 1
 * 输出：[1]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 链表中结点的数目为 sz
 * 1 <= sz <= 30
 * 0 <= Node.val <= 100
 * 1 <= n <= sz
 * 
 * 
 * 
 * 
 * 进阶：你能尝试使用一趟扫描实现吗？
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var p1: ListNode? = head
        var p2: ListNode? = dummy
        var count = 0
        while p1?.next != nil {
            p1 = p1?.next
            count += 1
            guard count >= n else { continue }
            p2 = p2?.next
        }
        p2?.next = p2?.next?.next
        return dummy.next
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
    static func build(_ array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        let head = ListNode(array[0])
        var p = head
        for i in 1..<array.count {
            let node = ListNode(array[i])
            p.next = node
            p = node
        }
        return head
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

let l1 = ListNode.build([1, 2, 3, 4, 5])
let l2 = ListNode.build([1])
let l3 = ListNode.build([1, 2])

let solution = Solution()
print("l1: \(l1?.log ?? "")")
print("l1 => \(solution.removeNthFromEnd(l1, 2)?.log ?? "")")
print("l2: \(l2?.log ?? "")")
print("l2 => \(solution.removeNthFromEnd(l2, 1)?.log ?? "")")
print("l3: \(l3?.log ?? "")")
print("l3 => \(solution.removeNthFromEnd(l3, 2)?.log ?? "")")
