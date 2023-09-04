/*
 * @lc app=leetcode.cn id=886 lang=swift
 *
 * [886] 可能的二分法
 *
 * https://leetcode-cn.com/problems/possible-bipartition/description/
 *
 * algorithms
 * Medium (46.21%)
 * Likes:    161
 * Dislikes: 0
 * Total Accepted:    13.5K
 * Total Submissions: 28.9K
 * Testcase Example:  '4\n[[1,2],[1,3],[2,4]]'
 *
 * 给定一组 n 人（编号为 1, 2, ..., n）， 我们想把每个人分进任意大小的两组。每个人都可能不喜欢其他人，那么他们不应该属于同一组。
 * 
 * 给定整数 n 和数组 dislikes ，其中 dislikes[i] = [ai, bi] ，表示不允许将编号为 ai 和
 * bi的人归入同一组。当可以用这种方法将所有人分进两组时，返回 true；否则返回 false。
 * 
 * 
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：n = 4, dislikes = [[1,2],[1,3],[2,4]]
 * 输出：true
 * 解释：group1 [1,4], group2 [2,3]
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：n = 3, dislikes = [[1,2],[1,3],[2,3]]
 * 输出：false
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：n = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
 * 输出：false
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= n <= 2000
 * 0 <= dislikes.length <= 10^4
 * dislikes[i].length == 2
 * 1 <= dislikes[i][j] <= n
 * ai < bi
 * dislikes 中每一组都 不同
 * 
 * 
 * 
 * 
 */

// @lc code=start
class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        isBipartite(buildGraph(n, dislikes: dislikes))
    }

    private func buildGraph(_ n: Int, dislikes: [[Int]]) -> [[Int]] {
        var graph = [[Int]].init(repeating: [Int](), count: n + 1)
        for dislike in dislikes {
            let v = dislike[0]
            let w = dislike[1]
            graph[v].append(w)
            graph[w].append(v)
        }
        return graph
    }
    
    private var isOk: Bool = true
    private var color = [Bool]()
    private var visited = [Bool]()
    private func isBipartite(_ graph: [[Int]]) -> Bool {
        isOk = true
        color = [Bool].init(repeating: false, count: graph.count)
        visited = [Bool].init(repeating: false, count: graph.count)
        for v in 0..<graph.count {
            traverse(graph, v: v)
        }
        return isOk
    }
    private func traverse(_ graph: [[Int]], v: Int) {
        guard isOk else { return }
        visited[v] = true
        for w in graph[v] {
            if visited[w] {
                if color[w] == color[v] {
                    isOk = false
                }
            } else {
                color[w] = !color[v]
                traverse(graph, v: w)
            }
        }
    }
}
// @lc code=end

