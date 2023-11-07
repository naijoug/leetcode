/*
 * @lc app=leetcode.cn id=543 lang=swift
 *
 * [543] 二叉树的直径
 *
 * https://leetcode-cn.com/problems/diameter-of-binary-tree/description/
 *
 * algorithms
 * Easy (56.32%)
 * Likes:    953
 * Dislikes: 0
 * Total Accepted:    193.1K
 * Total Submissions: 342.3K
 * Testcase Example:  '[1,2,3,4,5]'
 *
 * 给定一棵二叉树，你需要计算它的直径长度。一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点。
 * 
 * 
 * 
 * 示例 :
 * 给定二叉树
 * 
 * ⁠         1
 * ⁠        / \
 * ⁠       2   3
 * ⁠      / \     
 * ⁠     4   5    
 * 
 * 
 * 返回 3, 它的长度是路径 [4,2,1,3] 或者 [5,2,1,3]。
 * 
 * 
 * 
 * 注意：两结点之间的路径长度是以它们之间边的数目表示。
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

    var diameter: Int = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        maxDepth(root)
        return diameter
    }
    
    @discardableResult
    private func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let leftMax = maxDepth(root.left)
        let rightMax = maxDepth(root.right)
        diameter = max(diameter, leftMax + rightMax)

        return max(leftMax, rightMax) + 1
    }
}
// @lc code=end

class Solution1 {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDiameter(root), diameterOfBinaryTree(root.left), diameterOfBinaryTree(root.right))
    }

    private func maxDiameter(_ root: TreeNode?) -> Int {
        maxDepth(root?.left) + maxDepth(root?.right)
    }

    private func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}