//
//  1971. Find if Path Exists in Graph.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/07/25.
//

let solution = Solution()
print(solution.validPath(3, [[0,1],[1,2],[2,0]], 0, 2)) //true
print(solution.validPath(6, [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5)) //false

class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var graph: [[Int]] = Array(repeating: [Int](), count: n)
        var visited: [Bool] = Array(repeating: false, count: n)
        var queue: [Int] = []
        //그래프 만들기
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        //큐, 방문기록
        queue.append(source)
        visited[source] = true

        while !queue.isEmpty {
            let current = queue.removeFirst()
            if current == destination { return true }

            for vertex in graph[current] {
                if !visited[vertex] {
                    visited[vertex] = true
                    queue.append(vertex)
                }
            }
        }
        return false
    }
}
