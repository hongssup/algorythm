//
//  1000 A+B.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2021/04/06.
//

import Foundation

//1
let input = readLine()!
let lineArr = line.components(separatedBy: " ")
let a = Int(lineArr[0])!
let b = Int(lineArr[1])!
print(a+b)

//2
let input = readLine()!
let intArr = line.components(separatedBy: " ").map { Int($0)! }
print(intArr.reduce(0, +))

//3
print((readLine()?.split(separator: " ").map { Int($0)! }.reduce(0, +))!)

//4 8ms
let input = readLine()!.split(separator: " ").map { Int($0) }
let a = input[0]
let b = input[1]
print("\(a+b)")

//5 8ms
let array = readLine()!.split(separator: " ")
if let a = Int(array[0]), let b = Int(array[1]) {
    print(a+b)
}

//6 4ms
print((readLine()?.split(separator: " ").map { Int($0)! }.reduce(0) { $0 + $1 })!)

//7 4ms
let line = readLine()!
print(line.characters.split(separator:" ").map{Int(String($0))!}.reduce(0,{$0 + $1}))

