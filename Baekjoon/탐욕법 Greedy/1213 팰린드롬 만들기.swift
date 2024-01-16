//
//  1213 팰린드롬 만들기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 1/16/24.
//
// https://www.acmicpc.net/problem/1213
// Silver 3

// 69108KB 8ms
let name = readLine()!
print(palindrome(word: name))

func palindrome(word: String) -> String {
    var dict = [Character: Int]()
    var oddNumberCount: Int = 0
    var center: String = ""
    var result: String = ""
    
    for i in name {
        if let _ = dict[i] {
            dict[i]! += 1
        } else {
            dict[i] = 1
        }
    }
    
    for (key, value) in dict.sorted(by: {$0.0 < $1.0}) {
        if value % 2 == 1 {
            center = String(key)
            oddNumberCount += 1
            if oddNumberCount > 1 {
                return "I'm Sorry Hansoo"
            }
        }
        result += String(repeating: String(key), count: value / 2)
    }
    return (result + center + String(result.reversed()))
}
