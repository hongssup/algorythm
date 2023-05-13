//
//  2078. Two Furthest Houses With Different Colors.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/13.
//

let solution = Solution()
print(solution.maxDistance([1,1,1,6,1,1,1])) //3
print(solution.maxDistance([1,8,3,8,3])) //4
print(solution.maxDistance([0,1])) //1
print(solution.maxDistance([0,18,10])) //2
print(solution.maxDistance([4,4,4,11,4,4,11,4,4,4,4,4])) //8

class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        var result = Int()
        let count = colors.count / 2 + colors.count % 2
        
        for i in 0..<count {
            for j in stride(from: colors.count - 1, through: count, by: -1) {
                if colors[i] != colors[j] {
                    result = max(result, j-i)
                    break
                }
            }
        }
        return result
    }
}

//다른 풀이
class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        var result = Int()
        let count = colors.count - 1
        
        for i in 0...count {
            // find max distance from last index || find max distance from index 0
            if colors[i] != colors[count] || colors[0] != colors[count - i] {
                result = count - i
                break
            }
        }
        
        return result
    }
}
