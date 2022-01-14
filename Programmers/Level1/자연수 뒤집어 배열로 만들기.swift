//
//  자연수 뒤집어 배열로 만들기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/14.
//

/*
 문제 설명
 자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.
 제한 조건
 - n은 10,000,000,000이하인 자연수입니다.
 */

print(solution(12345)) //[5,4,3,2,1]

//내풀이
func solution(_ n:Int64) -> [Int] {
    return String(n).reversed().map { Int(String($0))! }
}

//compactMap 사용
func solution(_ n:Int64) -> [Int] {
    return String(n).reversed().compactMap { Int(String($0)) }
}
