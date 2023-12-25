//
//  15565 귀여운 라이언.swift
//  algorythm
//
//  Created by SeoYeon Hong on 12/25/23.
//
// https://www.acmicpc.net/problem/15565
// Silver 1

// 122352KB 208ms
let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
let k = nk[1]
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var lions = [Int]()

for i in 0..<n {
    if input[i] == 1 {
        lions.append(i)
    }
}

if lions.count < k {
    print(-1)
} else {
    var length = 0
    var result = n
    var start = 0, end = k - 1
    while end < lions.count {
        length = lions[end] - lions[start] + 1
        result = min(result, length)
        start += 1
        end += 1
    }
    print(result)
}
