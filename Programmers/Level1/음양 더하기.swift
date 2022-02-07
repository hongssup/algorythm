//
//  음양 더하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/07.
//

/*
 문제 설명
 어떤 정수들이 있습니다. 이 정수들의 절댓값을 차례대로 담은 정수 배열 absolutes와 이 정수들의 부호를 차례대로 담은 불리언 배열 signs가 매개변수로 주어집니다. 실제 정수들의 합을 구하여 return 하도록 solution 함수를 완성해주세요.

 제한사항
 absolutes의 길이는 1 이상 1,000 이하입니다.
 absolutes의 모든 수는 각각 1 이상 1,000 이하입니다.
 signs의 길이는 absolutes의 길이와 같습니다.
 signs[i] 가 참이면 absolutes[i] 의 실제 정수가 양수임을, 그렇지 않으면 음수임을 의미합니다.
 */

import Foundation

print(solution([4,7,12], [true,false,true])) //9
print(solution([1,2,3], [false,false,true])) //0

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    for i in 0..<signs.count {
        sum += signs[i] ? absolutes[i] : -absolutes[i]
    }
    return sum
}

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return (0..<signs.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
}

//다른답안
func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return zip(absolutes, signs).map { $1 ? $0 : -$0 }.reduce(0, +)
}
