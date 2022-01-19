//
//  약수의 합.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/19.
//

/*
 문제 설명
 정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.

 제한 사항
 n은 0 이상 3000이하인 정수입니다.
 */

print(solution(12)) //28
print(solution(5)) //6

//내답안
func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }
    let arr = Array<Int>(1...n).filter{n % $0 == 0}
    var result = 0
    for i in arr {
        result += i
    }
    return result
}

//모범답안
func solution(_ n:Int) -> Int {
    return n != 0 ? (1...n).filter{n % $0 == 0}.reduce(0,+) : 0
}
