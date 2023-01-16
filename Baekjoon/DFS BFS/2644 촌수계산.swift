//
//  2644 촌수계산.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/16.
//

/*
 문제
 여러 사람들에 대한 부모 자식들 간의 관계가 주어졌을 때, 주어진 두 사람의 촌수를 계산하는 프로그램을 작성하시오.
 입력
 사람들은 1, 2, 3, …, n (1 ≤ n ≤ 100)의 연속된 번호로 각각 표시된다.
 입력 파일의 첫째 줄에는 전체 사람의 수 n
 둘째 줄에는 촌수를 계산해야 하는 서로 다른 두 사람의 번호가 주어진다.
 셋째 줄에는 부모 자식들 간의 관계의 개수 m이 주어진다.
 넷째 줄부터는 부모 자식간의 관계를 나타내는 두 번호 x,y가 각 줄에 나온다. 이때 앞에 나오는 번호 x는 뒤에 나오는 정수 y의 부모 번호를 나타낸다.
 각 사람의 부모는 최대 한 명만 주어진다.
 출력
 입력에서 요구한 두 사람의 촌수를 나타내는 정수를 출력한다. 두 사람의 친척 관계가 전혀 없어 촌수를 계산할 수 없을 때에는 -1을 출력.
 */

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let start = input[0], end = input[1]
let m = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

//dfs 69108KB 8ms
var visited: [Bool] = Array(repeating: false, count: n+1)
var result = -1

visited[start] = true

func dfs(_ s: Int, _ sum: Int) {
    for i in graph[s] {
        if i == end {
            result = sum
            return
        }
        if !visited[i] {
            visited[i] = true
            dfs(i, sum + 1)
        }
    }
}

dfs(start, 1)
print(result)
