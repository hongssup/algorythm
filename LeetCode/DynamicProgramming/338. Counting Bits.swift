//
//  338. Counting Bits.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/18.
//

let solution = Solution()
print(solution.countBits(8)) //[0, 1, 1, 2, 1, 2, 2, 3, 1]

//O(n^2)
class Solution {
    func countBits(_ n: Int) -> [Int] {
        var binaryCount = [Int]()
        for i in 0...n {
            let binary = String(i, radix: 2)
            let count = binary.filter { $0 == "1" }.count
            binaryCount.append(count)
        }
        return binaryCount
    }
}
