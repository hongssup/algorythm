//
//  자릿수 더하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/17.
//

/*
 문제 설명
 자연수 N이 주어지면, N의 각 자릿수의 합을 구해서 return 하는 solution 함수를 만들어 주세요.
 예를들어 N = 123이면 1 + 2 + 3 = 6을 return 하면 됩니다.

 제한사항
 N의 범위 : 100,000,000 이하의 자연수
 */

import Foundation

print(solution(987)) //24

//내답안
func solution(_ n:Int) -> Int {
    var answer:Int = 0
    let arr = String(n).map { Int(String($0))! }
    for i in 0...arr.count-1 {
        answer += arr[i]
    }
    return answer
}

//모범답안
for solution(_ n: Int) -> Int {
    var answer:Int = 0
    for i in String(n) {
        answer += Int(String(i))!
    }
    return answer
}
