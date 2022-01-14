//
//  정수 내림차순으로 배치하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/14.
//

/*
 문제 설명
 함수 solution은 정수 n을 매개변수로 입력받습니다. n의 각 자릿수를 큰것부터 작은 순으로 정렬한 새로운 정수를 리턴해주세요. 예를들어 n이 118372면 873211을 리턴하면 됩니다.

 제한 조건
 - n은 1이상 8000000000 이하인 자연수입니다.
 */

print(solution(118372)) //873211

//내답안
func solution(_ n:Int64) -> Int64 {
    let arr = String(n).map{ String($0) }
    return Int64(String(arr.sorted().joined().reversed()))!
}

//모범답안
func solution(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}
