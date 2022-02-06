//
//  나머지가 1이 되는 수 찾기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/06.
//

/*
 문제 설명
 자연수 n이 매개변수로 주어집니다. n을 x로 나눈 나머지가 1이 되도록 하는 가장 작은 자연수 x를 return 하도록 solution 함수를 완성해주세요. 답이 항상 존재함은 증명될 수 있습니다.

 제한사항
 3 ≤ n ≤ 1,000,000
 */

import Foundation

print(solution(10)) //3
print(solution(12)) //11

//내답안
func solution(_ n:Int) -> Int {
    for i in 2..<n {
        if n % i == 1 { return i }
    }
    return 0
}

//다른답안
func solution(_ n: Int) -> Int {
    var answer = 1
    while n % answer != 1 {
        answer += 1
    }
    return answer
}
