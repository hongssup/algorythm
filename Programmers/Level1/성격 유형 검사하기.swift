//
//  성격 유형 검사하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/10/29.
//

/*
 문제 설명
 질문마다 판단하는 지표를 담은 1차원 문자열 배열 survey와 검사자가 각 질문마다 선택한 선택지를 담은 1차원 정수 배열 choices가 매개변수로 주어집니다. 이때, 검사자의 성격 유형 검사 결과를 지표 번호 순서대로 return 하도록 solution 함수를 완성해주세요.
 제한사항
 - 1 ≤ survey의 길이 ( = n) ≤ 1,000
   survey의 원소는 "RT", "TR", "FC", "CF", "MJ", "JM", "AN", "NA" 중 하나
 - choices의 길이 = survey의 길이
   1 ≤ choices의 원소 ≤ 7
*/

import Foundation

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5])) //"TCMA"

//내답안
func solution(_ survey:[String], _ choices:[Int]) -> String {
    let types = ["R", "T", "C", "F", "J", "M", "A", "N"]
    var score = Array(repeating: 0, count: types.count)
    var result = ""
    
    for i in 0..<survey.count {
        if choices[i] == 4 {
            continue
        } else if choices[i] < 4 {
            score[types.firstIndex(of: String(survey[i].first!))!] += (4 - choices[i])
        } else {
            score[types.firstIndex(of: String(survey[i].last!))!] += (choices[i] - 4)
        }
    }

    for i in stride(from: 0, to: score.count, by: 2) {
        if score[i] >= score[i+1] {
            result += types[i]
        } else {
            result += types[i+1]
        }
    }

    return result
}

//다른답안
func solution(_ survey:[String], _ choices:[Int]) -> String {
    var score = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A":0, "N": 0]
    var result = ""
    
    for i in 0..<survey.count {
        let first = String(survey[i].first!)
        let last = String(survey[i].last!)
        
        switch choices[i] {
        case 1...3:
            score[first]! += (4 - choices[i])
        case 5...7:
            score[last]! += (choices[i] - 4)
        default:
            break
        }
    }

    score["R"]! >= score["T"]! ? result.append("R") : result.append("T")
    score["C"]! >= score["F"]! ? result.append("C") : result.append("F")
    score["J"]! >= score["M"]! ? result.append("J") : result.append("M")
    score["A"]! >= score["N"]! ? result.append("A") : result.append("N")
    return result
}
