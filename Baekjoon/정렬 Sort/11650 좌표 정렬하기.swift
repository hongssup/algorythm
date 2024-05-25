//
//  11650 좌표 정렬하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/25/24.
//
//  https://www.acmicpc.net/problem/11650
//  Silver 5

/*
 - 배열 안에 배열을 사용하는 것보다 튜플을 넣는 것이 메모리가 더 절약됨
 - 미세한 차이지만 map을 쓰면 메모리가 더 들고 시간이 더 절약되고,
   compactMap을 쓰면 메모리가 절약되고 시간이 더 드는 듯
 */

// 72236KB 236ms
let n = Int(readLine()!)!
var matrix: [(Int, Int)] = []

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").compactMap { Int($0) }
    matrix.append((xy[0], xy[1]))
}

matrix.sort { ($0.0, $0.1) < ($1.0, $1.1) }

for xy in matrix {
    print("\(xy.0) \(xy.1)")
}
