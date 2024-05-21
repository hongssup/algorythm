//
//  2839 설탕 배달.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/21/24.
//
//  https://www.acmicpc.net/problem/2839
//  Silver 4

// 내 답안 69100KB 8ms
let n = Int(readLine()!)!

print(delivery(n))

func delivery(_ n: Int) -> Int {
    if n % 5 == 0 { return n / 5 }
    for i in stride(from: (n / 5), through: 0, by: -1) {
        if (n - (5 * i)) % 3 == 0 {
            return i + ((n - (5 * i)) / 3)
        }
    }
    return -1
}

// 69100KB 8ms - while문 사용하여 좀 더 간결하게
var n = Int(readLine()!)!
var answer = 0

while n > 0 {
    if n % 5 == 0 {
        n -= 5
    } else {
        n -= 3
    }
    
    answer += 1
}

print(n == 0 ? answer : -1)
