//
//  K번째수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/31.
//

import Foundation

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])) //[5,6,3]

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { (array[$0[0]-1...$0[1]-1].sorted())[$0[2]-1] }
}

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    for i in commands {
        let arr = array[i[0]-1...i[1]-1].sorted()
        result.append(arr[i[2]-1])
    }
    return result
}
