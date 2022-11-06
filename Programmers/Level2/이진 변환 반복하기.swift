//
//  이진 변환 반복하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/03.
//

/*
 문제 설명
 0과 1로 이루어진 어떤 문자열 x에 대한 이진 변환을 다음과 같이 정의합니다.
 1. x의 모든 0을 제거합니다.
 2. x의 길이를 c라고 하면, x를 "c를 2진법으로 표현한 문자열"로 바꿉니다.
 0과 1로 이루어진 문자열 s가 "1"이 될 때까지 계속해서 s에 이진 변환을 가했을 때, 이진 변환의 횟수와 변환 과정에서 제거된 모든 0의 개수를 각각 배열에 담아 return 하도록 solution 함수를 완성해주세요.
 제한사항
 - s의 길이는 1 이상 150,000 이하입니다.
 - s에는 '1'이 최소 하나 이상 포함되어 있습니다.
*/

import Foundation

print(solution("110010101001")) //[3,8]
print(solution("01110")) //[3,3]
print(solution("1111111")) //[4,1]

func solution(_ s:String) -> [Int] {
    var convertCount = 0
    var zeroCount = 0
    var s = s
    while s != "1" {
        let count = s.filter{ $0 == "1" }.count
        zeroCount += (s.count - count)
        s = String(count, radix: 2)
        convertCount += 1
    }
    return [convertCount, zeroCount]
}
