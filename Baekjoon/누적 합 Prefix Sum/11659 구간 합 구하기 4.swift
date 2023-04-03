//
//  11659 구간 합 구하기 4.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/03.
//

/*
 문제
 수 N개가 주어졌을 때, i번째 수부터 j번째 수까지 합을 구하는 프로그램을 작성하시오.
 제한
 1 ≤ N ≤ 100,000
 1 ≤ M ≤ 100,000
 1 ≤ i ≤ j ≤ N
 */

// Prefix Sum O(n) 76200KB 268ms
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var arr = readLine()!.split(separator: " ").compactMap { Int($0) }
var prefixSum = Array(repeating: 0, count: n + 1)

for i in 1...n {
    prefixSum[i] = prefixSum[i-1] + arr[i-1]
}

for _ in 0..<m {
    let interval = readLine()!.split(separator: " ").compactMap { Int($0) }
    print(prefixSum[interval[1]] - prefixSum[interval[0] - 1])
}

// 시간초과 O(n^2)
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = nm[1]
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

for _ in 0..<m {
    let interval = readLine()!.split(separator: " ").compactMap { Int($0) }
    var sum = 0
    for i in (interval[0] - 1)..<interval[1] {
        sum += arr[i]
    }
    print(sum)
}
