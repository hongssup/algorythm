//
//  2224. Minimum Number of Operations to Convert Time.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/16.
//

let solution = Solution()
print(solution.convertTime("02:30", "04:35")) //3

class Solution {
    func convertTime(_ current: String, _ correct: String) -> Int {
        let current = (Int(current.prefix(2))! * 60) + Int(current.suffix(2))!
        let correct = (Int(correct.prefix(2))! * 60) + Int(correct.suffix(2))!
        var interval = correct - current

        var result = 0
        let operationTime = [60,15,5,1]
        
        for i in operationTime {
            result += interval / i
            interval = interval % i
            if interval == 0 { break }
        }

        return result
    }
}
