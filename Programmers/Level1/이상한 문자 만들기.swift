//
//  이상한 문자 만들기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/29.
//

/*
 문제 설명
 문자열 s는 한 개 이상의 단어로 구성되어 있습니다. 각 단어는 하나 이상의 공백문자로 구분되어 있습니다. 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.

 제한 사항
 문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
 첫 번째 글자는 0번째 인덱스로 보아 짝수번째 알파벳으로 처리해야 합니다.
 */

print(solution("try hello world")) //TrY HeLlO WoRlD

func solution(_ s:String) -> String {
    var result = ""
    var index = 0
    for i in s {
        if i == " " {
            index = 0
            result += " "
        } else {
            if index%2 == 0 {
                result += i.uppercased()
            } else {
                result += i.lowercased()
            }
            index += 1
        }
    }
    return result
}

func solution(_ s:String) -> String {
    var result = [String]()
    var index = 0
    for i in s {
        if i == " " {
            index = 0
            result.append(" ")
        } else {
            if index%2 == 0 {
                result.append(i.uppercased())
            } else {
                result.append(i.lowercased())
            }
            index += 1
        }
    }
    return result.joined()
}
