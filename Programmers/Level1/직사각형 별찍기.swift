//
//  직사각형 별찍기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/11.
//

/*
 문제 설명
 이 문제에는 표준 입력으로 두 개의 정수 n과 m이 주어집니다.
 별(*) 문자를 이용해 가로의 길이가 n, 세로의 길이가 m인 직사각형 형태를 출력해보세요.
 제한조건
  - n과 m은 각각 1000 이하인 자연수입니다.
 */

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])
for _ in 1...b {
    print(String(repeating: "*", count: a))
}
