//
//  BinaryGap.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/05/20.
//

/*
 Find longest sequence of zeros in binary representation of an integer.
 */

import Foundation

print(solution(9)) //2
print(solution(529)) //4
print(solution(15)) //0
print(solution(32)) //0

public func solution(_ N : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let n = String(N, radix: 2)
    var zeroCnt = 0
    var zeroLen = [Int]()
    for i in n {
        if i == "0" { zeroCnt += 1 }
        else {
            zeroLen.append(zeroCnt)
            zeroCnt = 0
        }
    }
    return zeroLen.max() ?? 0
}
