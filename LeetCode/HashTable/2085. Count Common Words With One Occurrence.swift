//
//  2085. Count Common Words With One Occurrence.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/24.
//

let solution = Solution()
print(solution.countWords(["leetcode","is","amazing","as","is"], ["amazing","leetcode","is"])) //2

class Solution {
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var dict1 = [String:Int]()
        var dict2 = [String:Int]()
        var result = 0
        
        for word in words1 {
            dict1[word, default: 0] += 1
        }
        
        for word in words2 {
            dict2[word, default: 0] += 1
        }
        
        for (key, value) in dict1 {
            if value == 1 && dict2[key] == 1 {
                result += 1
            }
        }
        
        return result
    }
}
