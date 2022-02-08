//
//  숫자 문자열과 영단어.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/08.
//

/*
 문제 설명
 다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.
 1478 → "one4seveneight"
 234567 → "23four5six7"
 10203 → "1zerotwozero3"
 이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 - 1 ≤ s의 길이 ≤ 50
 - s가 "zero" 또는 "0"으로 시작하는 경우는 주어지지 않습니다.
 - return 값이 1 이상 2,000,000,000 이하의 정수가 되는 올바른 입력만 s로 주어집니다.
 */

import Foundation

print(solution("one4seveneight")) //1478
print(solution("23four5six7")) //234567
print(solution("2three45sixseven")) //234567
print(solution("123")) //123

func solution(_ s:String) -> Int {
    let num = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var result = s
    for i in 0..<num.count {
        if s.contains(num[i]) {
            result = result.replacingOccurrences(of: num[i], with: String(i))
        }
    }
    return Int(result)!
}
