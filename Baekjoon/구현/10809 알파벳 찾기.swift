//
//  10809 알파벳 찾기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/31/24.
//
//  https://www.acmicpc.net/problem/10809
//  Bronze 2

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var result: String = ""
let word = readLine()!
for letter in alphabet {
    if let stringIndex = word.firstIndex(of: letter) {
        let index = word.distance(from: word.startIndex, to: stringIndex)
        result += "\(Int(index)) "
    } else {
        result += "-1 "
    }
}

print(result)
