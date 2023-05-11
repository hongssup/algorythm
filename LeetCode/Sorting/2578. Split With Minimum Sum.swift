//
//  2578. Split With Minimum Sum.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/03.
//

let solution = Solution()
print(solution.splitNum(4325)) //59
print(solution.splitNum(687)) //75
print(solution.splitNum(40235)) //59

//O(n log n)
class Solution {
    func splitNum(_ num: Int) -> Int {
        var sortedNum = Array(String(num)).sorted()
        var num1 = "", num2 = ""
        
        for i in 0..<sortedNum.count {
            if i % 2 == 0 {
                num1 += String(sortedNum[i])
            } else {
                num2 += String(sortedNum[i])
            }
        }
        
        return Int(num1)! + Int(num2)!
    }
}
