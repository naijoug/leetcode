print("Int.min: \(Int.min)")
print("Int.max: \(Int.max)")
print("Int16.min: \(Int16.min)")
print("Int16.max: \(Int16.max)")
print("Int32.min: \(Int32.min)")
print("Int32.max: \(Int32.max)")

let array = Array(repeating: 1, count: 10)
print(array)

/// 链表节点
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, _ next: ListNode? = nil) { 
        self.val = val
        self.next = next 
    }
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
extension ListNode: CustomStringConvertible {
    public var description: String {
        var msg = "\(val)"
        var p: ListNode? = self.next
        while let val = p?.val {
            msg += "->\(val)"
            p = p?.next
        }
        return msg
    }
}

/// 二叉树节点
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int = 0, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}