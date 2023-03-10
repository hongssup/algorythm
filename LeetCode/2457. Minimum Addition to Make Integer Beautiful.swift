//
//  2457. Minimum Addition to Make Integer Beautiful.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/03/10.
//

/*
 You are given two positive integers n and target.
 An integer is considered beautiful if the sum of its digits is less than or equal to target.
 Return the minimum non-negative integer x such that n + x is beautiful. The input will be generated such that it is always possible to make n beautiful.

 Constraints:
 - 1 <= n <= 10^12
 - 1 <= target <= 150
 - The input will be generated such that it is always possible to make n beautiful.
 */

print(solution.makeIntegerBeautiful(16, 6)) //6
print(solution.makeIntegerBeautiful(467, 6)) //33
print(solution.makeIntegerBeautiful(1, 1)) //0

class Solution {
    func makeIntegerBeautiful(_ n: Int, _ target: Int) -> Int {
        var array = String(n).map({ Int(String($0))! })
        var sum = array.reduce(0, +)
        var beautiful = n
        
        for i in 0..<array.count {
            var zero = 1
            if sum > target {
                for _ in 0..<i {
                    zero *= 10
                }
                let temp = (10 - array[array.count - 1 - i]) * zero
                beautiful += temp
                array = String(beautiful).map({ Int(String($0))! })
                sum = array.reduce(0, +)
            } else {
                break
            }
        }
        
        return beautiful - n
    }
}
