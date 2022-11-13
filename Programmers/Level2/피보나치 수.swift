//
//  피보나치 수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/13.
//

/*
 문제 설명
 피보나치 수는 F(0) = 0, F(1) = 1일 때, 1 이상의 n에 대하여 F(n) = F(n-1) + F(n-2) 가 적용되는 수 입니다.
 예를들어 다음과 같이 이어집니다.
 F(2) = F(0) + F(1) = 0 + 1 = 1
 F(3) = F(1) + F(2) = 1 + 1 = 2
 F(4) = F(2) + F(3) = 1 + 2 = 3
 F(5) = F(3) + F(4) = 2 + 3 = 5
 2 이상의 n이 입력되었을 때, n번째 피보나치 수를 1234567으로 나눈 나머지를 리턴하는 함수, solution을 완성해 주세요.
 제한 사항
 n은 2 이상 100,000 이하인 자연수입니다.
*/

print(solution(3)) //2
print(solution(5)) //5

//내답안
func solution(_ n:Int) -> Int {
    var first = 0
    var second = 1
    
    for _ in 2...n {
        let temp = first + second
        first = second
        second = temp % 1234567
    }
    return second
}

//참고용 dp 풀이
func solution(_ n: Int) -> Int {
    if n < 2 { return n }
    var fibonacci = Array(repeating: 0, count: n+1)
    fibonacci[0] = 0
    fibonacci[1] = 1
    for i in 2...n {
        fibonacci[i] = (fibonacci[i-2] + fibonacci[i-1]) % 1234567
    }
    return fibonacci[n]
}
