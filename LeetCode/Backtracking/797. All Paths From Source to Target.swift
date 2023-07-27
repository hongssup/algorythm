//
//  797. All Paths From Source to Target.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/07/27.
//
//  Backtracking, DFS, Graph - Medium

let solution = Solution()
print(solution.allPathsSourceTarget([[1,2],[3],[3],[]])) //[[0,1,3],[0,2,3]]
print(solution.allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]])) //[[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var path = [0]

        dfs(0)

        func dfs(_ v: Int) {
            if v == graph.count - 1 {
                result.append(path)
                return
            }

            for vertex in graph[v] {
                path.append(vertex)
                dfs(vertex)
                path.removeLast()
            }
        }
        return result
    }
}
