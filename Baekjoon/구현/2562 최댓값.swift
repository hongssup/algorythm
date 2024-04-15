//
//  2562 최댓값.swift
//  algorythm
//
//  Created by SeoYeon Hong on 4/13/24.
//
// https://www.acmicpc.net/problem/2562
// Bronze 3

var result = (0, 0)
for i in 0..<9 {
    let n = Int(readLine()!)!
    if result.1 < n {
        result = (i, n)
    }
}

print("\(result.1)\n\(result.0 + 1)")
