//
//  신고 결과 받기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/01.
//

/*
 문제 설명
 이용자의 ID가 담긴 문자열 배열 id_list, 각 이용자가 신고한 이용자의 ID 정보가 담긴 문자열 배열 report, 정지 기준이 되는 신고 횟수 k가 매개변수로 주어질 때, 각 유저별로 처리 결과 메일을 받은 횟수를 배열에 담아 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 - 2 ≤ id_list 의 길이 ≤ 1,000
 - 1 ≤ report 의 길이 ≤ 200,000
 - 1 ≤ k ≤ 200, k는 자연수입니다.
 - return 하는 배열은 id_list에 담긴 id 순서대로 각 유저가 받은 결과 메일 수를 담으면 됩니다.
 */

import Foundation

print(solution(["con", "ryan"],["ryan con", "ryan con", "ryan con", "ryan con"],3)) //[0,0]
print(solution(["muzi", "frodo", "apeach", "neo"],["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"],2)) //[2,1,1,0]

//내답안
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let report = Set(report) //1. 중복 제거
    var reportDict = [String:[String]]()
    var mailDict = [String:Int]()
    var result = [Int]()
    //2. 신고자 목록 dict - 신고받은 사람 : [신고한 사람들]
    for i in report {
        let reporter = String(i.split(separator: " ")[0])
        let reported = String(i.split(separator: " ")[1])
        if reportDict[reported] != nil {
            reportDict[reported]?.append(reporter)
        } else {
            reportDict.updateValue([reporter], forKey: reported)
        }
    }
    //3. 신고한 사용자 dict - 신고한 사람 : 메일 수신횟수
    for (key, value) in reportDict {
        if value.count >= k {
            for i in value {
                if mailDict[i] != nil {
                    mailDict[i]! += 1
                } else {
                    mailDict.updateValue(1, forKey: i)
                }
            }
        }
    }
    //4. 답안 배열 생성
    for i in id_list {
        result.append(mailDict[i] ?? 0)
    }
    return result
}
