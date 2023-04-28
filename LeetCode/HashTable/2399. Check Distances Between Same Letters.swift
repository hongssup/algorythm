//
//  2399. Check Distances Between Same Letters.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/24.
//

let solution = Solution()
print(solution.checkDistances("abaccb", [1,3,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])) //true

class Solution {
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        var dict: [Character:Int] = [:]
        let array = s.map { $0 }
        
        for i in 0..<array.count {
            if let first = dict[array[i]] {
                dict[array[i]] = i - first - 1
            } else {
                dict[array[i]] = i
            }
        }
        
        for (key, value) in dict {
            let index = key.asciiValue! - Character("a").asciiValue!
            if value != distance[Int(index)] {
                return false
            }
        }
        
        return true
    }
}
