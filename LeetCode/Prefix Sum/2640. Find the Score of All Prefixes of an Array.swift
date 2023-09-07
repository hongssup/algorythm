//
//  2640. Find the Score of All Prefixes of an Array.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/09/07.
//

let solution = Solution()
print(solution.findPrefixScore([2,3,7,5,10])) //[2,4,8,16,32,64]

class Solution {
    func findPrefixScore(_ nums: [Int]) -> [Int] {
        var maxNum = nums[0]
        var conver = 0
        var result = [Int]()
        for i in nums {
            maxNum = max(maxNum, i)
            conver += i + maxNum
            result.append(conver)
        }
        return result
    }
}
