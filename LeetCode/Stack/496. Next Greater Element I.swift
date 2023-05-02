//
//  496. Next Greater Element I.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/30.
//

let solution = Solution()
print(solution.nextGreaterElement([4,1,2], [1,3,4,2]))//[-1,3,-1]
print(solution.nextGreaterElement([2,4], [2,1,3,4]))//[3,-1]
print(solution.nextGreaterElement([4,3,6,2,5], [5,2,1,6,3,4]))//[-1,4,-1,6,6]

// O(n)
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict: [Int:Int] = [:]
        var stack: [Int] = []
        var ans: [Int] = []
        
        for num in nums2 {
            while let last = stack.last, num > last {
                dict[last] = num
                stack.removeLast()
            }
            stack.append(num)
        }
        
        for num in nums1 {
            ans.append(dict[num] ?? -1)
        }
        
        return ans
    }
}

//O(n^2)
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var ans: [Int] = []
        
        for num in nums1 {
            ans.append(-1)
            let index = nums2.firstIndex(of: num)!
            for i in (index + 1)..<nums2.count {
                if num < nums2[i] {
                    ans[ans.count - 1] = nums2[i]
                    break
                }
            }
        }
        return ans
    }
}
