//
//  1931 회의실 배정.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/13.
//

let n = Int(readLine()!)!
var meetings = [(Int,Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    meetings.append((input[0],input[1]))
}

meetings.sort{ ($0.0,$0.1) < ($1.0,$1.1) }

var end = 0
var count = 0
for meeting in meetings {
    if end <= meeting.0 {
        end = meeting.1
        count += 1
    }
}
print(count)
