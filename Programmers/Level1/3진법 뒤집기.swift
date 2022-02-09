//
//  3진법 뒤집기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/09.
//

/*
 문제 설명
 자연수 n이 매개변수로 주어집니다. n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 - n은 1 이상 100,000,000 이하인 자연수입니다.
 */

import Foundation

print(solution(45)) //7
print(solution(125)) //229

//내답안
func solution(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}

//풀이
func solution(_ n:Int) -> Int {
    let binary = String(n, radix: 3)
    let reversed = String(binary.reversed())
    let decimal = Int(reversed, radix: 3)!
    return decimal
}

//radix 안쓰고 풀기
func solution(_ n:Int) -> Int {
    var decimal = n
    var binary = [Int]()
    while decimal > 0 {
        binary.append(decimal % 3)
        decimal /= 3
    }
    binary = binary.reversed()
    var result = 0
    for i in 0..<binary.count {
        result += Int(pow(3.0, Float(i))) * binary[i]
    }
    return result
}


