//
//  문자열 다루기 기본.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2021/04/10.
//

let s = readLine()!
solution(s)

//제출. +11
func solution(_ s:String) -> Bool {
    let c = s.count
    if c == 4 || c == 6 {
        return c == (s.filter{$0.isNumber}).count
    } else {
        return false
    }
}

//실행시간 초과
func solution(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        return s.count == (s.filter{$0.isNumber}).count ? true : false
    } else {
        return false
    }
}

// 
func solution(_ s:String) -> Bool {
    return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
}

//
func solution(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        return Int(s) != nil
    }
    return false
}
