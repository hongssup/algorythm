//
//  하샤드 수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/09.
//

/*
 문제 설명
 양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다. 예를 들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다. 자연수 x를 입력받아 x가 하샤드 수인지 아닌지 검사하는 함수, solution을 완성해주세요.
 제한 조건
 - x는 1 이상, 10000 이하인 정수입니다.
 */

print(solution(12)) //true
print(solution(13)) //false

//내답안
func solution(_ x:Int) -> Bool {
    let s = String(x)
    let arr = s.map {Int(String($0))!}
    var sum = 0
    for i in arr {
        sum += i
    }
    return (x % sum == 0) ? true : false
}

//모범답안
func solution(_ x:Int) -> Bool {
    var sum = 0
    for i in String(x) {
        sum += Int(String(i))!
    }
    return (x % sum == 0)
}

//고차함수 사용답안
func solution(_ x:Int) -> Bool {
    var sum = String(x).map { Int(String($0))! }.reduce(0, +)
    return (x % sum == 0)


