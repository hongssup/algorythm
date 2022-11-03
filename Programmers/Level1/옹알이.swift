//
//  옹알이.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/10/28.
//

/*
 문제 설명
 머쓱이는 태어난 지 11개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음과 네 가지 발음을 조합해서 만들 수 있는 발음밖에 하지 못하고 연속해서 같은 발음을 하는 것을 어려워합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.
 제한사항
 - 1 ≤ babbling의 길이 ≤ 100
 - 1 ≤ babbling[i]의 길이 ≤ 30
 - 문자열은 알파벳 소문자로만 이루어져 있습니다.
 */

import Foundation

print(solution(["aya", "yee", "u", "maa"])) //1
print(solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"])) //2
print(solution(["aya", "yee", "u", "maa", "wyeoo"])) //1

//내답안
func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    var result = 0

    for i in babbling {
        var bab = i
        for j in words {
            if bab.contains(j + j) { break }
            bab = bab.replacingOccurrences(of: j, with: ".")
        }
        if bab.filter({ $0 == "." }).count == bab.count { 
            result += 1
        }
    }

    return result
}

//다른답안
func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    var result = 0

    for i in babbling {
        var bab = i
        var valid = [String]()
        var word = ""
        for b in bab {
            word = word + String(b)
            if words.contains(word) && valid.last != word {
                valid.append(word)
                word = ""
            }
        }
        if word == "" {
            result += 1
        }
    }
    
    return result
}
