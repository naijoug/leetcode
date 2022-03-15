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
