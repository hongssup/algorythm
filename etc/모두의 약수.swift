//
//  모두의 약수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/12/15.
//

/*
 자연수 N이 입력되면 1부터 N까지의 각 숫자들의 약수의 개수를 순서대로 출력하는 프로그램을 작성하세요.
 자연수 N (5<=N<=50,000)
 입력 : 8
 출력 : 1 2 2 3 2 4 2 4
 */

import Foundation

let input = readLine()!
let N = Int(input)!
print(divisor(N))

//시간복잡도 O(nlogn)
func divisor(_ N: Int) -> String {
    var result = Array(repeating: 0, count: N)
    for i in 1...N {
        for j in stride(from: i, through: N, by: i) {
            result[j-1] += 1
        }
    }
    return result.map{ String($0) }.joined(separator: " ")
}

//시간복잡도 O(n^2)
func divisor(_ N: Int) -> String {
    var result = Array(repeating: 0, count: N)
    for i in 1...N {
        for j in 1...i {
            if i % j == 0 {
                result[i-1] += 1
            }
        }
    }
    return result.map{ String($0) }.joined(separator: " ")
}
