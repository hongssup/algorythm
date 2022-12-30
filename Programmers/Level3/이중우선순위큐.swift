//
//  이중우선순위큐.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/12.
//

/*
 이중 우선순위 큐는 다음 연산을 할 수 있는 자료구조를 말합니다.
 - I 숫자 : 큐에 주어진 숫자를 삽입합니다.
 - D 1 : 큐에서 최댓값을 삭제합니다. (둘 이상인 경우 하나만 삭제)
 - D -1 : 큐에서 최솟값을 삭제합니다.
 이중 우선순위 큐가 할 연산 operations가 매개변수로 주어질 때, 모든 연산을 처리한 후 큐가 비어있으면 [0,0] 비어있지 않으면 [최댓값, 최솟값]을 return 하도록 solution 함수를 구현해주세요.
 제한사항
 - operations는 길이가 1 이상 1,000,000 이하인 문자열 배열입니다.
 - operations의 원소는 큐가 수행할 연산을 나타냅니다.
 - 빈 큐에 데이터를 삭제하라는 연산이 주어질 경우, 해당 연산은 무시합니다.
*/

import Foundation

print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"])) //[0,0]
print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])) //[333, -45]

func solution(_ operations:[String]) -> [Int] {
    var stack = [Int]()
    for i in operations {
        let id = i.split(separator: " ")[0]
        let num = i.split(separator: " ")[1]
        if id == "I" {
            stack.append(Int(num)!)
        } else {
            if stack.count <= 0 { continue }
            if num == "1" {
                stack.remove(at: stack.firstIndex(of: stack.max()!)!)
            } else {
                stack.remove(at: stack.firstIndex(of: stack.min()!)!)
            }
        }
    }
    return (stack.count > 0) ? [stack.max()!, stack.min()!] : [0,0]
}
