//
//  두 정수 사이의 합.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2021/04/07.
//

import Foundation

let input = readLine()!
let arr = input.components(separatedBy: " ")
let a = Int(arr[0])!
let b = Int(arr[1])!
print(solution(a,b))

func solution(_ a: Int, _ b: Int) -> Int64 {
    var sum = 0
    if a==b {
        sum = a
    } else if a < b {
        for i in a...b { sum += i }
    } else {
        for i in b...a { sum += i }
    }
    return Int64(sum)
}
