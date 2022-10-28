//
//  콜라 문제.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/10/26.
//

/*
 문제 설명
 콜라를 받기 위해 마트에 주어야 하는 병 수 a, 빈 병 a개를 가져다 주면 마트가 주는 콜라 병 수 b, 상빈이가 가지고 있는 빈 병의 개수 n이 매개변수로 주어집니다.
 상빈이가 받을 수 있는 콜라의 병 수를 return 하도록 solution 함수를 작성해주세요.

 제한사항
 - 1 ≤ b < a ≤ n ≤ 1,000,000
 - 정답은 항상 int 범위를 넘지 않게 주어집니다.
 */

import Foundation

print(solution(2,1,20)) //19
print(solution(3,1,20)) //9
print(solution(5,2,20)) //12

//내답안
func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var result = 0
    var n = n
    while n >= a {
        result += (n/a)*b
        n = (n/a)*b + n%a
        print("result: \(result), n: \(n)")
    }
    return result
}

//다른답안
func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    return (n > b ? n - b : 0) / (a - b) * b
}
