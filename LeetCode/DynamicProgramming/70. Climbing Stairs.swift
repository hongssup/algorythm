//
//  70. Climbing Stairs.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/01.
//

/*
 You are climbing a staircase. It takes n steps to reach the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Constraints: 1 <= n <= 45
 */

let solution = Solution()
print(solution.climbStairs(3)) //3

//내답안
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 || n == 2 { return n }
        
        var result = [1,2]
        for i in 2..<n {
            result.append(result[i-2] + result[i-1])
        }
        return result[n-1]
    }
}

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var (first, second) = (1, 1)
        
        for _ in 1..<n {
            let temp = first + second
            first = second
            second = temp
        }
        return second
    }
}
