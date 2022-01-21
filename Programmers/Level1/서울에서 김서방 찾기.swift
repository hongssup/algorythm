//
//  서울에서 김서방 찾기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/21.
//

print(solution(["Jane", "Kim"])) //"김서방은 1에 있다"

func solution(_ seoul:[String]) -> String {
    "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}
