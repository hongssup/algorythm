//
//  2108 통계학.swift
//  algorythm
//
//  Created by SeoYeon Hong on 7/20/24.
//

import Foundation

// MARK: - 내 답안 89560KB 324ms

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n)
var sum = 0
var dict = [Int: Int]()

for i in 0..<n {
    arr[i] = Int(readLine()!)!
    sum += arr[i]
    if dict[arr[i]] != nil {
        dict[arr[i]]! += 1
    } else {
        dict[arr[i]] = 1
    }
}

if n == 1 {
    for _ in 0..<3 {
        print(sum)
    }
    print(0)
} else {
    let sortedArr = arr.sorted()
    let common = dict.sorted(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 })
    
    print(Int(round(Double(sum) / Double(n))))
    print(sortedArr[n/2])
    print(common[0].value == common[1].value ? common[1].key : common[0].key)
    print(sortedArr[n-1] - sortedArr[0])
}

// MARK: - 모범 답안 86120KB 308ms

let n = Int(readLine()!)!
var array: [Int] = []
var sum = 0
var dict: [Int:Int] = [:]

for _ in 0 ..< n {
    let num = Int(readLine()!)!
    array.append(num)
    sum += num
    dict[num, default: 0] += 1
}

// 산술평균
print(Int(round(Double(sum) / Double(n))))

// 중앙값
array.sort()
print(array[n/2])

// 최빈값
let maxValue = dict.values.max()
var mode = dict.filter({ $0.value == maxValue }).keys.sorted()
if mode.count > 1 {
    print(mode[1])
} else {
    print(mode[0])
}

// 범위
print(array.max()! - array.min()!)

// MARK: - 모범 답안 86124KB 300ms

let n = Int(readLine()!)!
var arr: [Double] = []
var dict: [Int:Int] = [:]

for _ in 0..<n {
    let tmp = Double(readLine()!)!
    arr.append(tmp)
    dict[Int(tmp), default: 0] += 1
}
arr.sort()
let max = dict.values.max()!
let tmp = dict.keys.filter { dict[$0] == max }.sorted()

print(Int(round(arr.reduce(0.0, +) / Double(arr.count))))
print(Int(arr[arr.count / 2]))
print(tmp.count >= 2 ? tmp[1]: tmp[0])
print(Int(arr[arr.count-1]) - Int(arr[0]))
