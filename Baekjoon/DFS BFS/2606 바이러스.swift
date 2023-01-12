//
//  2606 바이러스.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/12.
//

/*
 문제
 신종 바이러스인 웜 바이러스는 네트워크를 통해 전파된다. 한 컴퓨터가 웜 바이러스에 걸리면 그 컴퓨터와 네트워크 상에서 연결되어 있는 모든 컴퓨터는 웜 바이러스에 걸리게 된다.
 어느 날 1번 컴퓨터가 웜 바이러스에 걸렸다. 컴퓨터의 수와 네트워크 상에서 서로 연결되어 있는 정보가 주어질 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 출력하는 프로그램을 작성하시오.
 입력
 첫째 줄에는 컴퓨터의 수. 컴퓨터의 수는 100 이하이고 각 컴퓨터에는 1번 부터 차례대로 번호가 매겨진다.
 둘째 줄에는 네트워크 상에서 직접 연결되어 있는 컴퓨터 쌍의 수.
 이어서 그 수만큼 한 줄에 한 쌍씩 네트워크 상에서 직접 연결되어 있는 컴퓨터의 번호 쌍이 주어진다.
 출력
 1번 컴퓨터가 웜 바이러스에 걸렸을 때, 1번 컴퓨터를 통해 웜 바이러스에 걸리게 되는 컴퓨터의 수를 첫째 줄에 출력한다.
 */

//DFS 69108KB 8ms
let n = Int(readLine()!)!
let pair = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: n+1)
for _ in 0..<pair {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var visited: [Bool] = Array(repeating: false, count: n+1)
var result = 0

visited[1] = true
dfs(1)
print(result)

func dfs(_ node: Int) {
    for i in graph[node] {
        if !visited[i] {
            visited[i] = true
            result += 1
            dfs(i)
        }
    }
}
