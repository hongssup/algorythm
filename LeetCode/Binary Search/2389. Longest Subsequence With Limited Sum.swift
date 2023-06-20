//
//  2389. Longest Subsequence With Limited Sum.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/06/20.
//

let solution = Solution()
print(solution.answerQueries([4,5,2,1], [3,10,21])) //[2,3,4]
print(solution.answerQueries([2,3,4,5], [1])) //[0]

class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var nums = nums.sorted()
        var sums = Array(repeating: 0, count: nums.count + 1)
        var result = [Int]()

        for i in 1...nums.count {
            sums[i] = sums[i-1] + nums[i-1]
        }

        for i in queries {
            result.append(binarySearch(sums, i))
        }
        
        return result
    }
    
    func binarySearch(_ sums: [Int], _ query: Int) -> Int {
        var s = 0
        var e = sums.count
        
        while s < e {
            let mid = (s + e) / 2
            if sums[mid] <= query {
                s = mid + 1
            } else {
                e = mid
            }
        }
        
        return s - 1
    }
}
