/*
 * @lc app=leetcode.cn id=146 lang=swift
 *
 * [146] LRU 缓存
 *
 * https://leetcode-cn.com/problems/lru-cache/description/
 *
 * algorithms
 * Medium (52.55%)
 * Likes:    2025
 * Dislikes: 0
 * Total Accepted:    308.3K
 * Total Submissions: 586.6K
 * Testcase Example:  '["LRUCache","put","put","get","put","get","put","get","get","get"]\n' +
  '[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]'
 *
 * 请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。
 * 
 * 实现 LRUCache 类：
 * 
 * 
 * 
 * 
 * LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存
 * int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
 * void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组
 * key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。
 * 
 * 
 * 函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。
 * 
 * 
 * 
 * 
 * 
 * 示例：
 * 
 * 
 * 输入
 * ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 * [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 * 输出
 * [null, null, null, 1, null, -1, null, -1, 3, 4]
 * 
 * 解释
 * LRUCache lRUCache = new LRUCache(2);
 * lRUCache.put(1, 1); // 缓存是 {1=1}
 * lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 * lRUCache.get(1);    // 返回 1
 * lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 * lRUCache.get(2);    // 返回 -1 (未找到)
 * lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 * lRUCache.get(1);    // 返回 -1 (未找到)
 * lRUCache.get(3);    // 返回 3
 * lRUCache.get(4);    // 返回 4
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= capacity <= 3000
 * 0 <= key <= 10000
 * 0 <= value <= 10^5
 * 最多调用 2 * 10^5 次 get 和 put
 * 
 * 
 */

// @lc code=start

class LRUCache {

    private var dict = [Int: Node]()
    private var linkedList = DoubleLinkedList()
    
    private let capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = dict[key] else { return -1 }
        linkedList.remove(node)
        linkedList.append(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard let node = dict[key] else {
            if linkedList.size == capacity, let node = linkedList.removeFirst() {
                dict.removeValue(forKey: node.key)
            }
            let node = Node(key, value: value)
            linkedList.append(node)
            dict[key] = node
            return
        }
        linkedList.remove(node)
        let newNode = Node(key, value: value)
        linkedList.append(newNode)
        dict[key] = newNode
    }
}

class Node {
    var key: Int
    var value: Int
    var prev: Node?
    var next: Node?
    init(_ key: Int, value: Int, prev: Node? = nil, next: Node? = nil) {
        self.key = key
        self.value = value
        self.prev = prev
        self.next = next
    }
}
class DoubleLinkedList {
    private(set) var size: Int = 0
    private let head: Node
    private let tail: Node
    init() {
        self.head = Node(0, value: 0)
        self.tail = Node(0, value: 0)
        head.next = tail
        tail.prev = head
    }

    /// 添加节点
    func append(_ node: Node) {
        let last = tail.prev
        last?.next = node
        node.prev = last
        node.next = tail
        tail.prev = node
        size += 1
    }
    /// 删除指定节点
    func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
        size -= 1
    }
    /// 删除链头节点
    func removeFirst() -> Node? {
        guard let first = head.next, first !== tail else { return nil }
        remove(first)
        return first
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

extension Node: CustomStringConvertible {
    var description: String { "\(key)=\(value)"  }
}
extension DoubleLinkedList: CustomStringConvertible {
    var description: String {
        var msg = ""
        while let node = head.next, node !== tail {
            msg += msg.isEmpty ? "" : " -> "
            msg += "\(node)"
            print("\(msg)")
        }
        return msg
    }
}
extension LRUCache {
    func log() {
        print("dict: \(dict)")
    }
}

let cache = LRUCache(2)
cache.log()
cache.put(1, 1)
cache.log()
cache.put(2, 2)
cache.log()
print(cache.get(1))
cache.put(3, 3)
cache.log()
print(cache.get(2))
cache.put(4, 4)
cache.log()
print(cache.get(1))
print(cache.get(3))
print(cache.get(4))