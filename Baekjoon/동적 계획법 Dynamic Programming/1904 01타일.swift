//
//  1904 01타일.swift
//  algorythm
//
//  Created by SeoYeon Hong on 1/19/24.
//
// https://www.acmicpc.net/problem/1904
// Silver 3

// 내 답안 - recursion 69100KB 12ms
let n = Int(readLine()!)

print(dfs(1, 0, 1))
func dfs(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a == n { return (b + c) % 15746 }
    return dfs(a + 1, c % 15746, (b + c) % 15746)
}

// 다른 답안 - dp
let n = Int(readLine()!)!

var a = 1, b = 2
if n <= 2 { b = n }
else {
    for _ in 2..<n {
        let tmp = a
        a = b
        b = (tmp + b) % 15746
    }
}
print(b)
