//
//  정수 제곱근 판별.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/12.
//

/*
 문제 설명
 임의의 양의 정수 n에 대해, n이 어떤 양의 정수 x의 제곱인지 아닌지 판단하려 합니다.
 n이 양의 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 양의 정수 x의 제곱이 아니라면 -1을 리턴하는 함수를 완성하세요.
 제한 사항
 - n은 1이상, 50000000000000 이하인 양의 정수입니다.
 */

print(solution(121)) //144

//내답안
func solution(_ n:Int64) -> Int64 {
    for i in 1...n {
        if i*i == n { return (i+1)*(i+1) }
        if n < i*i { return -1 }
    }
    return 0
}

//모범답안
func solution(_ n:Int64) -> Int64 {
    var i:Int64 = 1
    while i*i < n {
        i += 1
    }
    return (i*i == n) ? (i+1)*(i+1) : -1
}

//고차함수 사용답안
import Foundation
func solution(_ n:Int64) -> Int64 {
    let t = Int64(sqrt(Double(n)))
    return t * t == n ? (t+1)*(t+1) : -1
}
