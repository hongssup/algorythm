//
//  약수의 개수와 덧셈.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/08.
//

/*
 문제 설명
 두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ left ≤ right ≤ 1,000
*/

import Foundation

print(solution(13,17)) //43
print(solution(24,27)) //52

//내답안
func solution(_ left:Int, _ right:Int) -> Int {
    var sum = 0
    for i in left…right {
        sum += (1…i).filter{ i%$0 == 0 }.count % 2 == 0 ? i : -i
    }
    return sum
}

func solution(_ left:Int, _ right:Int) -> Int {
    return (left…right).map { i in (1…i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
}
