//
//  1546 평균.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/21/24.
//
//  https://www.acmicpc.net/problem/1546
//  Bronze 1

// 69100KB 8ms
let n = Double(readLine()!)!
var scores: [Double] = readLine()!.split(separator: " ").compactMap { Double($0) }
let max: Double = scores.max()!
var sum: Double = 0.0

for score in scores {
    sum += score / max * 100
}
print(sum / n)

/*
 주의할 점
 나눗셈을 할 때에는 Double형이어야 한다.
 형변환 해주기 보다는 그냥 입력 값을 받아올 때 Double 로 받아오는 것이 이득!
 */
