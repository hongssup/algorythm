//
//  1676 팩토리얼 0의 개수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/26/24.
//
//  https://www.acmicpc.net/problem/1676
//  Silver 5

// 왜 틀림??
let n = Int(readLine()!)!
var result = 0
if n != 0 {
    var last = 1
    for i in 1...n {
        var factorial = last * i
        if factorial % 10 == 0 {
            
            while factorial % 10 == 0, (factorial / 10) != 0 {
                result += 1
                factorial /= 10
            }
            last = factorial
            print("i: \(i), num: \(last * i), last: \(last), result: \(result)")
        } else {
            last = factorial % 10
        }
    }
}
print(result)

// 답이래
let n = Int(readLine()!)!

print(n/5 + n/25 + n/125)
