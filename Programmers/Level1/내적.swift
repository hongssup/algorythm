//
//  내적.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/04.
//

/*
 문제 설명
 길이가 같은 두 1차원 정수 배열 a, b가 매개변수로 주어집니다. a와 b의 내적을 return 하도록 solution 함수를 완성해주세요.
 이때, a와 b의 내적은 a[0]*b[0] + a[1]*b[1] + ... + a[n-1]*b[n-1] 입니다. (n은 a, b의 길이)

 제한사항
 - a, b의 길이는 1 이상 1,000 이하입니다.
 - a, b의 모든 수는 -1,000 이상 1,000 이하입니다.
 */

import Foundation

print(solution([1,2,3,4], [-3,-1,0,2])) //3
print(solution([-1,0,1], [1,0,-1])) //-2

//내답안
func solution(_ a:[Int], _ b:[Int]) -> Int {
    return (0..<a.count).map { a[$0]*b[$0] }.reduce(0, +)
}

//풀이
func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum = 0
    for i in 0..<a.count {
        sum += a[i]*b[i]
    }
    return sum
}

//다른답안
func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map({$0 * $1}).reduce(0, +)
    return zip(a, b).map(*).reduce(0, +)
}
