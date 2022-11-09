//
//  프린터.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/04.
//

/*
 문제 설명
 중요도가 높은 문서를 먼저 인쇄하는 프린터는 아래와 같은 방식으로 인쇄 작업을 수행.
 1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
 2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
 3. 그렇지 않으면 J를 인쇄합니다.
 현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return 하도록 solution 함수를 작성해주세요.
 제한사항
 - 현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.
 - 인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.
 - location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.
*/

import Foundation

print(solution([2, 1, 3, 2], 2)) //1
print(solution([1, 1, 9, 1, 1, 1], 0)) //5

//내답안
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities
    var locations = [Int]()
    var result = 0
    for i in 0..<priorities.count {
        locations.append(i)
    }
    while true {
        let max = priorities.firstIndex(of: priorities.max()!)
        priorities.append(contentsOf: priorities[0..<max!])
        locations.append(contentsOf: locations[0..<max!])
        priorities = Array(priorities.dropFirst(max!))
        locations = Array(locations.dropFirst(max!))
        result += 1
        if location == locations[0] {
            break
        } else {
            priorities = Array(priorities.dropFirst())
            locations = Array(locations.dropFirst())
        }
    }
    return result
}

//보완답안 - 튜플 사용
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priority: [(Int, Int)] = priorities.enumerated().map {($0.offset, $0.element)}
    var result = 0

    while true {
        let first: (Int, Int) = priority.remove(at: 0)
        if priority.contains(where: { first.1 < $0.1 }) {
            priority.append(first)
        } else if first.0 == location {
            result = priorities.count - priority.count
            break
        }
    }
    return result
}
