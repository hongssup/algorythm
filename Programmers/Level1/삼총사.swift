//
//  삼총사.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/10/25.
//

/*
 문제 설명
 학생 3명의 정수 번호를 더했을 때 0이 되면 3명의 학생은 삼총사.
 학생들의 번호를 나타내는 정수 배열 number가 매개변수로 주어질 때, 학생들 중 삼총사를 만들 수 있는 방법의 수를 return 하도록 solution 함수를 완성하세요.

 제한사항
 - 3 ≤ number의 길이 ≤ 13
 - -1,000 ≤ number의 각 원소 ≤ 1,000
 - 서로 다른 학생의 정수 번호가 같을 수 있습니다.
 */

print(solution([-2, 3, 0, 2, -5])) //2
print(solution([-3, -2, -1, 0, 1, 2, 3])) //5
print(solution([-1, 1, -1, 1])) //0

func solution(_ number: [Int]) -> Int {
    var result = 0
    for i in 0..<(number.count - 2) {
        for j in (i+1)..<(number.count - 1) {
            for k in (j+1)..<number.count {
                if number[i] + number[j] + number[k] == 0 {
                    result += 1
                }
            }
        }
    }
    return result
}
