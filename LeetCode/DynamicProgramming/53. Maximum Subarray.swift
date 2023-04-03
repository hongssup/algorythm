//
//  53. Maximum Subarray.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/03.
//

/*
 Given an integer array nums, find the subarray with the largest sum, and return its sum.
 
 Constraints:
 1 <= nums.length <= 10^5
 -10^4 <= nums[i] <= 10^4
 */

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) //6
print(solution.maxSubArray([-2])) //-2
print(solution.maxSubArray([1])) //1

//모범답안
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var result = nums[0]

        for num in nums {
            sum = max(num, sum + num)
            result = max(result, sum)
        }

        return result
    }
}

//시간초과
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.max() ?? 0 < 0 { return nums.max() ?? 0 }
        var result = 0
        for i in 0..<nums.count {
            if nums[i] < 0 { continue }
            var sumArr = [0]
            for j in i..<nums.count {
                if sumArr.last! + nums[j] >= sumArr.last! {
                    sumArr[sumArr.count - 1] += nums[j]
                } else {
                    sumArr.append(sumArr.last! + nums[j])
                }
            }

            if let max = sumArr.max(), result < max {
                result = max
            }
        }
        return result
    }
}
