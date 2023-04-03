//
//  10211 Maximum Subarray.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/03.
//

/*
 문제
 N과 배열 X가 주어졌을 때, X의 maximum subarray의 합을 구하자.
 */

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    var (sum, ans) = (0, nums[0])
    
    for num in nums {
        sum = max(num, sum + num)
        ans = max(sum, ans)
    }
    print(ans)
}
