//
//  1259 팰린드롬수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/24/24.
//
//  https://www.acmicpc.net/problem/1259
//  Bronze 1

// 내 답안 69100KB 8ms
while true {
    let input = readLine()!
    if input == "0" { break }
    
    let half = input.count / 2
    let prefix = input.prefix(half).map { String($0) }
    let suffix = input.suffix(half).map { String($0) }
    
    print((prefix == suffix.reversed()) ? "yes" : "no")
}

// 모범 답안 69096KB 8ms
while let input = readLine(), input != "0" {
    print(input == String(input.reversed()) ? "yes" : "no")
}
