//
//  제일 작은 수 제거하기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/04.
//

func solution(_ arr:[Int]) -> [Int] {
    var arr = arr
    arr.remove(at: arr.firstIndex(of: arr.min()!)!)
    return arr.isEmpty ? [-1] : arr
}
