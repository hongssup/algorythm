//
//  1260 DFS와 BFS.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/11.
//

/*
 문제
 그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성하시오. 단, 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문하고, 더 이상 방문할 수 있는 점이 없는 경우 종료한다. 정점 번호는 1번부터 N번까지이다.
 입력
 정점의 개수 N, 간선의 개수 M, 탐색을 시작할 정점의 번호 V.
 M개의 줄에 간선이 연결하는 두 정점의 번호가 주어진다. 두 정점 사이에 여러개 간선 있을 수 있다. 간선은 양방향.
 출력
 첫째 줄에 DFS를 수행한 결과를, 그 다음 줄에는 BFS를 수행한 결과를 출력한다. V부터 방문된 점을 순서대로 출력하면 된다.
 */

import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = input[0], m = input[1], v = input[2]
var visited = Array(repeating: false, count: n+1)
var visitedBfs = Array(repeating: false, count: n+1)

//그래프 69508KB 24ms
var graph: [[Int]] = Array(repeating: [], count: n+1)
var queue = [Int]()

for i in 0..<m {
    let edge = readLine()!.split(separator: " ").compactMap{ Int($0) }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}
graph = graph.map { $0.sorted() }

dfs(v)
print("")
bfs(v)

func dfs(_ v: Int) {
    visited[v] = true
    print(v, terminator: " ")
    
    for node in graph[v] {
        if !visited[node] {
            dfs(node)
        }
    }
}

func bfs(_ start: Int) {
    queue.append(start)
    visitedBfs[start] = true
    
    while !queue.isEmpty {
        let v = queue.removeFirst()
        print(v, terminator: " ")

        for node in graph[v] {
            if !visitedBfs[node] {
                queue.append(node)
                visitedBfs[node] = true
            }
        }
    }
}

//행렬 76992KB 40ms
var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    matrix[edge[0]][edge[1]] = 1
    matrix[edge[1]][edge[0]] = 1
}

dfs(v)
print("")
bfs(v)

func dfs(_ v: Int) {
    visited[v] = true
    print(v, terminator: " ")
    
    for i in 1..<n+1 {
        if visited[i] == false && matrix[v][i] == 1 {
            dfs(i)
        }
    }
}

func bfs(_ start: Int) {
    queue.append(start)
    visitedBfs[start] = true
    
    while !queue.isEmpty {
        let v = queue.removeFirst()
        print(v, terminator: " ")
        
        for i in 1..<n+1 {
            if visitedBfs[i] == false && matrix[v][i] == 1 {
                queue.append(i)
                visitedBfs[i] = true
            }
        }

    }
}
