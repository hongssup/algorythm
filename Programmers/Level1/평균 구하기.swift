//
//  평균 구하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2021/05/09.
//

func solution(_ arr:[Int]) -> Double {
    var sum = 0
    for i in arr {
        sum += i
    }
    return Double(sum)/Double(arr.count)
}
