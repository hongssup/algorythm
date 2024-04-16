//
//  1157 단어 공부.swift
//  algorythm
//
//  Created by SeoYeon Hong on 4/13/24.
//
//  https://www.acmicpc.net/problem/1157
//  Bronze 1

let word = readLine()!.uppercased()
var dict = [Character: Int]()
for char in word {
    dict[char] = (dict[char] ?? 0) + 1
}

let max = dict.values.max()
let maxValue = dict.filter { $0.value == max }
print((maxValue.count == 1) ? maxValue.keys.first! : "?")
