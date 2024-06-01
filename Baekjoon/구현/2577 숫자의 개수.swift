//
//  2577 숫자의 개수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 6/1/24.
//
//  https://www.acmicpc.net/problem/2577
//  Bronze 2

var multiply = 1
for _ in 0..<3 {
    let n = Int(readLine()!)!
    multiply *= n
}
let arr = String(multiply).map { Int(String($0))! }
for i in 0..<10 {
    print(arr.filter { $0 == i }.count)
}
