//
//  위장.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/04.
//

/*
 문제 설명
 스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다. 스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.
 제한사항
 - clothes의 각 행은 [의상의 이름, 의상의 종류]로 이루어져 있습니다.
 - 스파이가 가진 의상의 수는 1개 이상 30개 이하입니다.
 - 같은 이름을 가진 의상은 존재하지 않습니다.
 - 모든 문자열의 길이는 1 이상 20 이하인 자연수이고 알파벳 소문자 또는 '_' 로만 이루어져 있습니다.
 - 스파이는 하루에 최소 한 개의 의상은 입습니다.
 */

import Foundation

print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])) //5
print(solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]])) //3

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String:[String]]()
    var result = 1

    for i in clothes {
        if dict[i[1]] != nil {
            dict[i[1]]?.append(i[0])
        } else {
            dict[i[1]] = [i[0]]
        }
    }
    
    for value in dict.values {
        result *= (1 + value.count)
    }
    
    return result - 1
}
