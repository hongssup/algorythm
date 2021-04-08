//
//  가운데 글자 가져오기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2021/04/09.
//

import Foundation

let s: String = "abcdefgh"
solution(s)

//1 
func solution(_ s:String) -> String {
    let midIndex = s.count/2
    var result: String = ""
    if s.count%2 == 1 {
        result = String(s[s.index(s.startIndex, offsetBy: midIndex)])
    } else {
        result = "\(s[s.index(s.startIndex, offsetBy: midIndex-1)])"+"\(s[s.index(s.startIndex, offsetBy: midIndex)])"
    }
    return result
}

//2
func solution(_ s:String) -> String {
    let midIndex = s.count/2
    let array = Array(s)
    return s.count%2 == 1 ? String(array[midIndex]) : String(array[midIndex-1...midIndex])
}
