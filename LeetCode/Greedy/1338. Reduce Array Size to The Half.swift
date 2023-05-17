//
//  1338. Reduce Array Size to The Half.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/16.
//

class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var dict = [Int:Int]()

        for i in arr {
            dict[i, default: 0] += 1
        }

        let sorted = dict.sorted(by: { $0.value > $1.value })
        var count = arr.count
        var result = 0
        
        for (_, value) in sorted {
            count -= value
            result += 1
            if count <= (arr.count / 2) { break }
        }
        
        return result
    }
}
