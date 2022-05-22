//
//  CyclicRotation.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/05/22.
//

/*
 Rotate an array to the right by a given number of steps.
 */

import Foundation

var arr = [3,8,9,7,6]
//var arr = [Int]()
print(solution(&arr, 3)) //[9,7,6,3,8]

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    if A.isEmpty { return A }
    let cnt = A.count - 1
    for _ in 0..<K {
        let tmp = A[cnt]
        for i in 0...cnt {
            if i == cnt {
                A[0] = tmp
            } else {
                A[cnt - i] = A[cnt - (i+1)]
            }
        }
    }
    return A
}
