//
//  4153 직각삼각형.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/27/24.
//
//  https://www.acmicpc.net/problem/4153
//  Bronze 3

// 내 답안 69108KB 8ms
while true {
    var tri = readLine()!.split(separator: " ").compactMap { Int($0) }
    if tri == [0, 0, 0] { break }
    tri.sort()
    if (tri[0] * tri[0]) + (tri[1] * tri[1]) == tri[2] * tri[2] {
        print("right")
    } else {
        print("wrong")
    }
}

// 모범 답안 69104KB 8ms
while let input = readLine(), input != "0 0 0" {
    let numbers = input.split(separator:" ").map{ Double($0)! * Double($0)! }.sorted(by: >)
    print( numbers[0] == numbers[1] + numbers[2] ? "right" : "wrong"  )
}
