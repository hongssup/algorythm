//
//  1337. The K Weakest Rows in a Matrix.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/06/18.
//

let solution = Solution()
print(solution.kWeakestRows([[1,1,1,1,1],[1,0,0,0,0],[1,1,0,0,0],[1,1,1,1,0],[1,1,1,1,1]], 3)) //[1,2,3]
print(solution.kWeakestRows([[1,1,0,0,0], [1,1,1,1,0], [1,0,0,0,0], [1,1,0,0,0], [1,1,1,1,1]], 3)) //[2,0,3]

//이분탐색 O(nlogn)
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var dict = [Int:Int]()
        var result = [Int]()
        for (i, element) in mat.enumerated() {
            dict.updateValue(binarySearch(element), forKey: i)
        }
        let tuple = dict.sorted(by: { ($0.1, $0.0) < ($1.1, $1.0) })
        for i in 0..<k {
            result.append(tuple[i].key)
        }
        return result
    }
    
    func binarySearch(_ arr: [Int]) -> Int {
        var start = 0
        var end = arr.count
        
        while start < end {
            let mid = (start + end) / 2
            if arr[mid] == 1 {
                start = mid + 1
            } else {
                end = mid
            }
        }
        return start
    }
}

//O(n^2)
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var dict = [Int:Int]()
        var result = [Int]()
        
        for (i, arr) in mat.enumerated() {
            let value = arr.filter { $0 == 1 }.count
            dict.updateValue(value, forKey: i)
        }
        let tuple = dict.sorted(by: { ($0.value, $0.key) < ($1.value, $1.key) })
        
        for i in 0..<k {
            result.append(tuple[i].key)
        }
        
        return result
    }
}
