//
//  타겟 넘버.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/05.
//

import Foundation

print(solution([1, 1, 1, 1, 1], 3)) //5
print(solution([4, 1, 2, 1], 4)) //2

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    // 재귀 함수
    func dfs(_ index: Int, _ sum: Int) {
        // 탈출 조건
        if index == numbers.count {
            if sum == target { result += 1 }
            return
        }
        // 수행 동작
        dfs(index + 1, sum + numbers[index])
        dfs(index + 1, sum - numbers[index])
    }
    
    dfs(0,0)
    
    return result
}
