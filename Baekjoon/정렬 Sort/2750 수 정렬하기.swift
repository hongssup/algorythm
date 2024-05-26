//
//  2750 수 정렬하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/26/24.
//
//  https://www.acmicpc.net/problem/2750
//  Bronze 2

let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
}
for num in arr.sorted() {
    print(num)
}
