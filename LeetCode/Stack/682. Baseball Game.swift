//
//  682. Baseball Game.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/28.
//

let solution = Solution()
print(solution.calPoints(["5","2","C","D","+"]))//30
print(solution.calPoints(["5","-2","4","C","D","9","+","+"]))//27

class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var points: [Int] = []
        for operation in operations {
            switch operation {
            case "C":
                points.removeLast()
            case "D":
                points.append(points.last! * 2)
            case "+":
                points.append(points[points.count-1] + points[points.count-2])
            default:
                points.append(Int(operation)!)
            }
        }
        return points.reduce(0, +)
    }
}
