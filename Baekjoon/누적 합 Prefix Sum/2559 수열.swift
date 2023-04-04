//
//  2559 수열.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/04.
//

/*
 문제
 매일 측정한 온도(정수)의 수열이 주어질 때, 연속적인 며칠 동안의 온도 합이 가장 큰 값을 계산
 입력
 N은 온도를 측정한 전체 날짜의 수. 2 ≤ N ≤ 100,000
 K는 합을 구하기 위한 연속적인 날짜의 수. 1 ≤ K ≤ N
 온도를 나타내는 N개의 정수는 모두 -100 이상 100 이하
 */

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, k) = (nk[0], nk[1])
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

//1. 누적합 76152KB 36ms
var prefixSum = Array(repeating: 0, count: n+1)
for i in 1...n {
    prefixSum[i] = prefixSum[i-1] + arr[i-1]
}
var result = prefixSum[k] - prefixSum[0]
for i in k...n {
    result = max(result, prefixSum[i] - prefixSum[i-k])
}
print(result)

//2. 슬라이딩 윈도우 76152KB 36ms : 배열을 돌면서 합의 앞 인자는 빼고, 뒷 인자는 추가해 최대와 비교
var window = arr.prefix(k).reduce(0, +)
var result = window
for i in k..<n {
    window += arr[i] - arr[i-k]
    result = max(result, window)
}
print(result)
