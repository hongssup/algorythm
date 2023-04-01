//
//  118. Pascal's Triangle.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/01.
//


let solution = Solution()
print(solution.generate(5)) //[[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[1]]

        if numRows == 1 { return result }

        for i in 1..<numRows {
            result.append([1])
            for j in 0..<(i-1) {
                let plus = result[i-1][j] + result[i-1][j+1]
                result[i].append(plus)
            }
            result[i].append(1)
        }
        return result

    }
}

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle = [[1]]

        for row in 1..<numRows {
            let prevRow = triangle.last!
            var newRow = Array(repeating: 1, count: row + 1)

            for j in 1..<row {
                newRow[j] = prevRow[j-1] + prevRow[j]
            }
            triangle.append(newRow)
        }
        return triangle
    }
}

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle = [[Int]](repeating: [1], count: numRows)

        for row in 1..<numRows {
            triangle[row] = [Int](repeating: 1, count: row + 1)

            for element in 1..<row {
                triangle[row][element] = triangle[row - 1][element - 1] + triangle[row - 1][element]
            }
        }
        return triangle
    }
}
