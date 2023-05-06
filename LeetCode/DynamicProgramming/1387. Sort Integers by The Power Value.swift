//
//  1387. Sort Integers by The Power Value.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/05.
//

let solution = Solution()
print(solution.getKth(12, 15, 2)) //13
print(solution.getKth(7, 11, 4)) //7
print(solution.getKth(999, 1000, 1)) //999

//Dynamic Programming
class Solution {
    var dp: [Int:Int] = [1:0]
    
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var dict = [Int:Int]()
        for i in lo...hi {
            dict[i] = getPower(i)
        }
        let result = dict.sorted(by: { ($0.value, $0.key) < ($1.value, $1.key) })

        return result[k-1].key
    }
    
    func getPower(_ x: Int) -> Int {
        if let power = dp[x] {
            return power
        }
        let power = (x % 2 == 0) ? getPower(x/2) + 1 : getPower(3 * x + 1) + 1
        dp[x] = power
        
        return power
    }
}

//Brute Force
class Solution {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var dict = [Int:Int]()
        for i in lo...hi {
            dict[i] = getPower(i)
        }
        let result = dict.sorted(by: { ($0.value, $0.key) < ($1.value, $1.key) })

        return result[k-1].key
    }

    func getPower(_ x: Int) -> Int {
        var x = x
        var power = 0
        while x != 1 {
            x = (x % 2 == 0) ? x / 2 : 3 * x + 1
            power += 1
        }
        return power
    }
}
