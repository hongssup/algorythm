//
//  119. Pascal's Triangle II.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/01.
//

let solution = Solution()
print(solution.getRow(3)) //[1,3,3,1]

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = [1]
        if rowIndex == 0 { return row }

        for i in 1...rowIndex {
            var newRow = Array(repeating: 1, count: i + 1)
            for j in 1..<i {
                newRow[j] = row[j-1] + row[j]
            }
            row = newRow
        }
        return row
    }
}
