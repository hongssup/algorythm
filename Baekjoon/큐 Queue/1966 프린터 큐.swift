//
//  1966 프린터 큐.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/03/30.
//

/*
 중요도가 높은 문서 순서대로 인쇄할 때, 원하는 문서가 몇 번째로 인쇄되는지 출력하는 문제
 */

//큐 포인터 사용 69108KB 8ms
let count = Int(readLine()!)!
for _ in 0..<count {
    let input = readLine()!.split(separator:" ").compactMap { Int($0) }
    var m = input[1] //타겟 인덱스
    var priority = readLine()!.split(separator: " ").compactMap { Int($0) } //중요도 배열

    var max = priority.max()
    var result = 0
    var index = 0
    while true {
        if priority[index] == max {
            priority[index] = 0
            result += 1
            if index == m { break }
            max = priority.max()
        } else {
            if index == m { m = priority.count }
            priority.append(priority[index])
            priority[index] = 0
        }
        index += 1
    }
    print(result)
}
