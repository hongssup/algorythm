//
//  1557. Minimum Number of Vertices to Reach All Nodes.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/07/30.
//
//  Graph - Medium

let solution = Solution()
print(solution.findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]])) //[0, 3]
print(solution.findSmallestSetOfVertices(5, [[0,1],[2,1],[3,1],[1,4],[2,4]])) //[0,2,3]
print(solution.findSmallestSetOfVertices(3, [[1,2],[1,0],[0,2]])) //[1]

// 모범답안
class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var visited = Array(repeating: false, count: n)
        var result = [Int]()
        
        for i in 0..<edges.count {
            visited[edges[i][1]] = true
        }
        
        for i in 0..<n {
            if visited[i] == false {
                result.append(i)
            }
        }

        return result
    }
}

// 내답안
class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph = Array(repeating: [Int](), count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
        }
        var visited = Array(repeating: false, count: n)
        var result = [Int]()
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                result.append(i)
                dfs(i)
            }
        }
        
        func dfs(_ v: Int) {
            for vertex in graph[v] {
                if vertex < v {
                    if let index = result.firstIndex(of: vertex) {
                        result.remove(at: index)
                    }
                }
                if !visited[vertex] {
                    visited[vertex] = true
                    dfs(vertex)
                }
            }
        }
        return result
    }
}
