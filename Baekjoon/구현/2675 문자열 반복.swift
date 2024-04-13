//
//  2675 문자열 반복.swift
//  algorythm
//
//  Created by SeoYeon Hong on 4/13/24.
//
//  https://www.acmicpc.net/problem/2675
//  Bronze 2

// 69014KB 8ms
let t = Int(readLine()!)!
var result = [String]()
for _ in 0..<t {
    let rs = readLine()!.split(separator: " ")
    let r = Int(rs[0])!
    let s = rs[1]
    var alphanumeric = ""
    for char in s {
        alphanumeric += String(repeating: char, count: r)
    }
    result.append(alphanumeric)
}

for string in result {
    print(string)
}

// 단순화
for _ in 0..<Int(readLine()!)! {
    let rs = readLine()!.split(separator: " ")
    let (r, s) = (Int(rs[0])!, rs[1])
    
    var alphanumeric = ""
    s.forEach {
        alphanumeric += String(repeating: $0, count: r)
    }
    print(alphanumeric)
}
