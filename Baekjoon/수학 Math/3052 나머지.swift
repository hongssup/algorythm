//
//  3052 나머지.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/29/24.
//
//  https://www.acmicpc.net/problem/3052
//  Bronze 2

var result: Set<Int> = []

for _ in 0..<10 {
    let n = Int(readLine()!)!
    result.insert(n % 42)
}

print(result.count)
