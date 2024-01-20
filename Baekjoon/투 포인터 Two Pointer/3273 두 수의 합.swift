//
//  3273 두 수의 합.swift
//  algorythm
//
//  Created by SeoYeon Hong on 1/20/24.
//
// https://www.acmicpc.net/problem/3273
// Silver 3

// 두번째 제출 - 76884KB 48ms
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let x = Int(readLine()!)!
var start = 0
var end = n - 1
var result = 0

while start < end {
    let sum = arr[start] + arr[end]
    
    if sum == x {
        result += 1
    }
    
    if sum <= x {
        start += 1
    } else {
        end -= 1
    }
}
print(result)

// 첫번째 제출 - 76884KB 52ms
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").compactMap { Int($0) }
let x = Int(readLine()!)!
var start = 0
var end = n - 1
var result = 0

arr = arr.sorted()
while start < end {
    if arr[start] + arr[end] < x {
        start += 1
    } else if arr[start] + arr[end] == x {
        result += 1
        start += 1

    } else if arr[start] + arr[end] > x {
        end -= 1
    }
}
print(result)
