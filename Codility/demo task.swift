//
//  demo task.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/04.
//

/*
 Write a function that given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
 For example, given A = [1,3,6,4,1,2], the function should return 5.
 Biven A = [1,2,3], the function should return 4.
 Given A = [-1,-3], the function should return 1.
 Write an efficient algorithm for the following assumptions:
 - N is an integer within the range [1...100,000]
 - each element of array A is an integer within the range [-1,000,000...1,000,000]
 */

import Foundation

var arr = [1,3,6,4,1,2] //5
var arr2 = [-1,-2,1,4] //2
var arr3 = [1,2,3] //4

print(solution(&arr))

public func solution(_ A: inout [Int]) -> Int {
    //A가 1을 포함하고 있지 않으면 1을 반환
    if !A.contains(1) { return 1 }
    //1을 포함할 경우 정렬, 중복제거
    A = Set(A).sorted()
    //반복문으로 A[i]가 양수일 경우 1부터 차례로 확인
    var temp = 1
    for i in 0..<A.count {
        if A[i] > 0 {
            if A[i] == temp {
                temp += 1
            } else {
                break
            }
        }
    }
    return temp
}
