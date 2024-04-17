//
//  10989 수 정렬하기 3.swift
//  algorythm
//
//  Created by SeoYeon Hong on 4/17/24.
//
//  https://www.acmicpc.net/problem/10989
//  Bronze 1

let n = Int(readLine()!)!
var countings = Array(repeating: 0, count: 10001)
var result = ""

for _ in 0..<n {
    countings[Int(readLine()!)!] += 1
}

for i in 1...10000 {
    result += String(repeating: "\(i)\n", count: countings[i])
}
print(result)
