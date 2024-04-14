//
//  8958 OX퀴즈.swift
//  algorythm
//
//  Created by SeoYeon Hong on 4/13/24.
//
//  https://www.acmicpc.net/problem/8958
//  Bronze 2

for _ in 0..<Int(readLine()!)! {
    let ox = readLine()!
    var result = 0, sum = 0
    
    ox.forEach {
        if $0 == "O" {
            sum += 1
            result += sum
        } else {
            sum = 0
        }
    }
    print(result)
}
