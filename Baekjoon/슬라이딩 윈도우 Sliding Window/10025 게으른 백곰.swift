//
//  10025 게으른 백곰.swift
//  algorythm
//
//  Created by SeoYeon Hong on 12/23/23.
//
// https://www.acmicpc.net/problem/10025
// Silver 3

/*
 양동이가 있는 x 좌표의 범위는 0 ~ 100만 까지인데, 백곰이 움직일 수 있는 거리 K 의 범위는 400만인 것에 주의하기
 범위가 100만일 경우, 배열에 100만개의 메모리를 할당하고 O(n)으로 100만번 반복문을 돌리는 것은 전혀 문제가 되지 않으니 너무 복잡하게 생각하지말자..!
 */

// 슬라이딩 윈도우 76920KB 156ms

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]           // 양동이 수
let k = nk[1]           // 최대 합 길이
var ice: [Int] = Array(repeating: 0, count: 1000001)
var sum = 0

for _ in 0..<n {
    let gx = readLine()!.split(separator: " ").compactMap { Int($0) }
    let index = gx[1]   // 양동이 x 좌표
    let value = gx[0]   // 얼음의 수
    ice[index] = value
    if index <= k * 2 { sum += value } // 최소 거리 내 얼음들의 합 구하기
}

// 얼음들의 합 최대 값 구하기
var maxSum = sum
var start = 0, end = k * 2
while end < 1000000 {
    end += 1
    sum -= ice[start]
    sum += ice[end]
    maxSum = max(maxSum, sum)
    start += 1
}

print(maxSum)
