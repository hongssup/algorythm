//
//  1884. Egg Drop With 2 Eggs and N Floors.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/07/23.
//

let solution = Solution()
print(solution.twoEggDrop(2)) //2
print(solution.twoEggDrop(100)) //14

//모범답안
class Solution {
    func twoEggDrop(_ n: Int) -> Int {
        var step = 0, drops = 0
        while drops < n {
            step += 1
            drops += step
        }
        return step
    }
}

class Solution {
    func twoEggDrop(_ n: Int) -> Int {
        var dp = [0]
        var result = 0
        while result < n {
            result = dp[dp.count - 1] + dp.count
            dp.append(result)
            print(dp)
        }
        return dp.count - 1
    }
}
