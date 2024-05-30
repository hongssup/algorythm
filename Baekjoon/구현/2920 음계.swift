//
//  2920 음계.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/30/24.
//
//  https://www.acmicpc.net/problem/2902
//  Bronze 2

// 내 답안 69104KB 8ms
let nums = readLine()?.split(separator: " ").compactMap { Int($0) }
var ascending = Array(1...8)
if nums == ascending {
    print("ascending")
} else if nums == ascending.reversed() {
    print("descending")
} else {
    print("mixed")
}

// 69096KB 8ms - 문자열 그대로 사용
let nums = readLine()!
let ascending = "1 2 3 4 5 6 7 8"
switch nums {
case ascending:
    print("ascending")
case String(ascending.reversed()):
    print("descending")
default:
    print("mixed")
}
