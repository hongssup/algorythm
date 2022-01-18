//
//  로또의 최고 순위와 최저 순위.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/18.
//

import Foundation

print(solution([44,1,0,0,31,25],[31,10,45,1,6,19])) //[3,5]
print(solution([0,0,0,0,0,0],[38,19,20,40,15,25])) //[1,6]
print(solution([45, 4, 35, 20, 3, 9],[20, 9, 3, 45, 4, 35])) //[1,1]

//내 답안
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zero_count = 0
    var overlap = 0
    var result = [6,6]
    for i in lottos {
        if win_nums.contains(i) { overlap += 1 }
        if i == 0 { zero_count += 1 }
    }
    switch overlap {
    case 1:
        result[0] = 6 - zero_count
    case 2:
        result[1] = 5
        result[0] = 5 - zero_count
    case 3:
        result[1] = 4
        result[0] = 4 - zero_count
    case 4:
        result[1] = 3
        result[0] = 3 - zero_count
    case 5:
        result[1] = 2
        result[0] = 2 - zero_count
    case 6:
        result[1] = 1
        result[0] = 1 - zero_count
    default:
        result[0] = 7 - zero_count
    }
    
    return result
}

//모범 답안
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zeroCount = lottos.filter { $0 == 0 }.count
    let winCount: Int = win_nums.filter { lottos.contains($0) }.count

    return [min(7-winCount-zeroCount,6), min(7-winCount,6)]
}
