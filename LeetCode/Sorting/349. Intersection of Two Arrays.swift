//
//  349. Intersection of Two Arrays.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/04.
//

let solution = Solution()
print(solution.intersection([4,9,5], [9,4,9,8,4]))

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int:Bool]()
        for i in nums1 {
            dict[i] = true
        }
        var result = [Int]()
        for i in Set(nums2) {
            if let _ = dict[i] {
                result.append(i)
            }
        }
        return result
    }
}

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(nums2))
    }
}
