/*
 * @lc app=leetcode.cn id=226 lang=swift
 *
 * [226] 翻转二叉树
 *
 * https://leetcode-cn.com/problems/invert-binary-tree/description/
 *
 * algorithms
 * Easy (79.04%)
 * Likes:    1205
 * Dislikes: 0
 * Total Accepted:    405K
 * Total Submissions: 512.2K
 * Testcase Example:  '[4,2,7,1,3,6,9]'
 *
 * 给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 
 * 
 * 输入：root = [4,2,7,1,3,6,9]
 * 输出：[4,7,2,9,6,3,1]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 
 * 
 * 输入：root = [2,1,3]
 * 输出：[2,3,1]
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：root = []
 * 输出：[]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 树中节点数目范围在 [0, 100] 内
 * -100 <= Node.val <= 100
 * 
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let node = root.left
        root.left = root.right
        root.right = node

        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}
// @lc code=end

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

