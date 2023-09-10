//
//  1806 부분합.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/09/10.
//

let ns = readLine()!.split(separator: " ").compactMap { Int($0) }
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }

print(subsequence(n: ns[0], s: ns[1], nums: nums))

print(subsequence(n: 10, s: 15, nums: [5,1,3,5,10,7,4,9,2,8])) //2
print(subsequence(n: 10, s: 55, nums: [5,1,3,5,10,7,4,9,2,8])) //0
print(subsequence(n: 10, s: 54, nums: [5,1,3,5,10,7,4,9,2,8])) //10

// 내 답안 - 누적 합 + 투 포인터 76292KB 44ms
func subsequence(n: Int, s: Int, nums: [Int]) -> Int {
    var prefixSum = Array(repeating: 0, count: n+1)
    var result = n
    var left = 0, right = 0

    for i in 1...n {
        prefixSum[i] = nums[i-1] + prefixSum[i-1]
    }

    if prefixSum[n] < s { return 0 }

    while right <= n {
        if prefixSum[right] - prefixSum[left] >= s {
            result = min(right - left, result)
            left += 1
        } else {
            right += 1
        }
    }

    return result
}

// 투 포인터 76292KB 44ms
func subsequence(n: Int, s: Int, nums: [Int]) -> Int {
    var sum = nums[0]
    var result = n + 1
    var left = 0, right = 0

    while true {
        if sum < s {
            right += 1
            if right == n { break }
            sum += nums[right]
        } else {
            result = min(result, right - left + 1)
            sum -= nums[left]
            left += 1
        }
    }

    return result == n + 1 ? 0 : result
}
