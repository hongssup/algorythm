//
//  카펫.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/03.
//

/*
 문제 설명
 Leo가 본 카펫에서 갈색 격자의 수 brown, 노란색 격자의 수 yellow가 매개변수로 주어질 때 카펫의 가로, 세로 크기를 순서대로 배열에 담아 return 하도록 solution 함수를 작성해주세요.
 제한사항
 - 갈색 격자의 수 brown은 8 이상 5,000 이하인 자연수입니다.
 - 노란색 격자의 수 yellow는 1 이상 2,000,000 이하인 자연수입니다.
 - 카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.
 */

import Foundation

print(solution(10, 2)) //[4, 3]
print(solution(8, 1)) //[3, 3]
print(solution(24, 24)) //[8, 6]

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result = [Int]()
    let num = (brown - 4)/2
    for i in 1..<num {
        if i * (num - i) == yellow {
            result.append(num - i + 2)
            result.append(i + 2)
            break
        }
    }
    return result
}
