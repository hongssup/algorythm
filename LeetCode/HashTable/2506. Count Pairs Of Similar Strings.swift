//
//  2506. Count Pairs Of Similar Strings.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/25.
//

import Foundation

let solution = Solution()
print(solution.similarPairs(["aba","aabb","abcd","bac","aabc"])) //2
print(solution.similarPairs(["aabb","ab","ba"])) //3

class Solution {
    func similarPairs(_ words: [String]) -> Int {
        var dict: [String:Int] = [:]
        var result = 0
        
        for word in words {
            let key = Set(word).sorted().map { String($0) }.joined()
            dict[key, default: 0] += 1
        }
        
        for (_, value) in dict {
            result += (value * (value - 1)) / 2
        }
        
        return result
    }
}
