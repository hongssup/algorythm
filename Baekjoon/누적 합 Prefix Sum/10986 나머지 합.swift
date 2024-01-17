//
//  10986 나머지 합.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/06.
//
//  Gold 3

//누적합 - 시간초과
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var psum = Array(repeating: 0, count: n+1)
for i in 1...n {
    psum[i] = arr[i-1] + psum[i-1]
}

var result = 0
for i in 1...n {
    for j in i...n {
        if (psum[j] - psum[i-1]) % m == 0 {
            result += 1
        }
    }
}
print(result)
