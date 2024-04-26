//
//  10814 나이순 정렬.swift
//  algorythm
//
//  Created by SeoYeon Hong on 4/26/24.
//
//  https://www.acmicpc.net/problem/10814
//  Silver 5

// 내 답안 - 71564KB 208ms
let n = Int(readLine()!)!
var members: [Int: [String]] = [:]

for _ in 0..<n {
    let person = readLine()!.split(separator: " ").compactMap { String($0) }
    if members[Int(person[0])!] != nil {
        members[Int(person[0])!]?.append(person[1])
    } else {
        members[Int(person[0])!] = [person[1]]
    }
}

// 모범답안 - 73820KB 168ms
let n = Int(readLine()!)!
var members = [(Int, String)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    members.append((Int(input[0])!, String(input[1])))
}
members.sort { $0.0 < $1.0 }
for (age, name) in members {
    print("\(age) \(name)")
}
