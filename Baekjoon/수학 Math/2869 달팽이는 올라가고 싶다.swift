//
//  2869 달팽이는 올라가고 싶다.swift
//  algorythm
//
//  Created by SeoYeon Hong on 4/19/24.
//
//  https://www.acmicpc.net/problem/2869
//  Bronze 1

// 내 답안 79512KB 12ms
import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = input[0], b = input[1], v = input[2]
let result = ceil(Double(v - a) / Double(a - b) + 1)

print(Int(result))

// 다른 답안 69104KB 8ms
let abv = readLine()!.split(separator: " ").map { Int($0)! }
var (a, b, v) = (abv[0], abv[1], abv[2])
let days = (v - b) / (a - b)

print((v - b) % (a - b) == 0 ? days : days + 1)
