//
//  922. Sort Array By Parity II.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/10.
//

import Foundation

let solution = Solution()
solution.sortArrayByParityII([4,2,5,7])

//O(2n)
class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var even = [Int]()
        var odd = [Int]()

        for num in nums {
            if num % 2 == 0 {
                even.append(num)
            } else {
                odd.append(num)
            }
        }

        var result = [Int]()
        for i in 0..<even.count {
            result.append(even[i])
            result.append(odd[i])
        }

        return result
    }
}

//O(n)
class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var result = Array(repeating:0, count:nums.count)
        var even = 0
        var odd = 1
        
        for num in nums{
            if num % 2 == 0{
                result[even] = num
                even += 2
            } else {
                result[odd] = num
                odd += 2
            }
        }
        return result
    }
}
