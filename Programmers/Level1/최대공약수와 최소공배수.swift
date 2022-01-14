//
//  최대공약수와 최소공배수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/13.
//

/*
 문제 설명
 두 수를 입력받아 두 수의 최대공약수와 최소공배수를 반환하는 함수, solution을 완성해 보세요. 배열의 맨 앞에 최대공약수, 그다음 최소공배수를 넣어 반환하면 됩니다. 예를 들어 두 수 3, 12의 최대공약수는 3, 최소공배수는 12이므로 solution(3, 12)는 [3, 12]를 반환해야 합니다.
 제한 사항
 두 수는 1이상 1000000이하의 자연수입니다.
 */

print(solution(2,5)) //[1,10]
print(solution(3,12)) //[3,12]
print(solution(10,15)) //[5,30]

//내답안
func solution(_ n:Int, _ m:Int) -> [Int] {
    var result = [1,1]
    var min: Int
    min = (n <= m) ? n : m
    for i in 1...min {
        if n%i == 0 && m%i == 0 {
            result[0] = i
        }
    }
    result[1] = n*m/(result[0])
    return result
}

//보완답안
func solution(_ n:Int, _ m:Int) -> [Int] {
    var result = [1,1]
    for i in 1...min(n, m) {
        if n%i == 0 && m%i == 0 {
            result[0] = i
        }
    }
    result[1] = n*m/(result[0])
    return result
}
