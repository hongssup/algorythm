//
//  2193 이친수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 1/20/24.
//
// https://www.acmicpc.net/problem/2193
// Silver 3

let n = Int(readLine()!)!
var a = 1, b = 1

if n < 3 {
    print(1)
} else {
    for _ in 3...n {
        let temp = a
        a = b
        b = temp + b
    }
    print(b)
}
