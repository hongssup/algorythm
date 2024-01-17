//
//  1735 분수 합.swift
//  algorythm
//
//  Created by SeoYeon Hong on 1/17/24.
//

// 유클리드 호제법 69104KB 8ms
let first = readLine()!.split(separator: " ").compactMap { Int($0) }
let second = readLine()!.split(separator: " ").compactMap { Int($0) }

var denominator = first[1] * second[1]
var numerator = first[0] * second[1] + first[1] * second[0]

let divider = gcd(numerator, denominator)
print(numerator / divider, denominator / divider)

func gcd(_ a: Int, _ b: Int) -> Int {
    print(a, b)
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}
