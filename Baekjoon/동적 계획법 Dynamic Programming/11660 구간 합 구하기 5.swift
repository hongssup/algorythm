//
//  11660 구간 합 구하기 5.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/06.
//
//  Silver 1

/*
 문제
 N x N 개의 수가 표에 채워져 있을 때, (x1,y1)부터 (x2,y2)까지 합을 구하는 프로그램을 작성하시오.
 입력
 첫째 줄에는 표의 크기 N, 합을 구해야 하는 횟수 M이 주어진다.
 둘째 줄부터 N개의 줄에는 표에 채워져 있는 수가, 다음 M개의 줄에는 네 개의 정수 x1,y1,x2,y2 가 주어진다.
 출력
 총 M줄에 걸쳐 (x1, y1)부터 (x2, y2)까지 합을 구해 출력한다.
 제한
 1 ≤ N ≤ 1024, 1 ≤ M ≤ 100,000
 표에 채워져 있는 수는 1,000보다 작거나 같은 자연수
 x1 ≤ x2, y1 ≤ y2
 */

//85696KB 584ms
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var matrix: [[Int]] = [Array(repeating: 0, count: n+1)]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    matrix.append([0] + input)
}

var dp = matrix
for i in 1...n {
    for j in 1...n {
        dp[i][j] = matrix[i][j] + dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1]
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (x1,y1,x2,y2) = (input[0], input[1], input[2], input[3])
    print(dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1])
}
