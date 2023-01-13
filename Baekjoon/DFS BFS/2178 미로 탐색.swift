//
//  2178 미로 탐색.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/13.
//

/*
 문제
 N×M크기의 배열로 표현되는 미로가 있다. 미로에서 1은 이동할 수 있는 칸을 나타내고, 0은 이동할 수 없는 칸을 나타낸다. 이러한 미로가 주어졌을 때, (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수를 구하는 프로그램을 작성하시오. 한 칸에서 다른 칸으로 이동할 때, 서로 인접한 칸으로만 이동할 수 있다.
 위의 예에서는 15칸을 지나야 (N, M)의 위치로 이동할 수 있다. 칸을 셀 때에는 시작 위치와 도착 위치도 포함한다.
 입력
 첫째 줄에 두 정수 N, M(2 ≤ N, M ≤ 100)이 주어진다. 다음 N개의 줄에는 M개의 정수로 미로가 주어진다. 각각의 수들은 붙어서 입력으로 주어진다.
 출력
 첫째 줄에 지나야 하는 최소의 칸 수를 출력한다. 항상 도착위치로 이동할 수 있는 경우만 입력으로 주어진다.
 */

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0], m = input[1]

var maze = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.compactMap { Int(String($0)) }
    maze.append(input)
}

//69240KB 12ms : 방문여부/최단거리 따로 저장하지 않고, maze 좌표 내의 값을 직접 바꾸며 푸는 방법
let dx = [0,0,-1,1], dy = [-1,1,0,0] //상하좌우

print(bfs())

func bfs() -> Int {
    var queue: [[Int]] = [[0,0]]
    
    while !queue.isEmpty {
        let prev = queue.removeFirst()
        let x = prev[0], y = prev[1]
        
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]
            
            if nx >= 0 && nx < n && ny >= 0 && ny < m && maze[nx][ny] == 1 {
                maze[nx][ny] = maze[x][y] + 1
                queue.append([nx, ny])
            }
        }
    }
    return maze[n-1][m-1]
}

//69376KB 12ms
var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)

let dx = [0,0,-1,1]
let dy = [-1,1,0,0]

bfs()
print(distance[n-1][m-1])

func bfs() {
    distance[0][0] = 1
    visited[0][0] = true
    
    var queue: [[Int]] = [[0,0]]
    
    while !queue.isEmpty {
        let prev = queue.removeFirst()
        let x = prev[0]
        let y = prev[1]
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && nx < n && ny >= 0 && ny < m {
                if !visited[nx][ny] && maze[nx][ny] == 1 {
                    distance[nx][ny] = distance[x][y] + 1
                    visited[nx][ny] = true
                    queue.append([nx, ny])
                }
            }
        }
    }
}
