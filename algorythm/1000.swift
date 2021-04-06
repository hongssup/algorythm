//
//  1000.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2021/04/06.
//

import Foundation

//1
let line = readLine()!
let lineArr = line.components(separatedBy: " ")
let a = Int(lineArr[0])!
let b = Int(lineArr[1])!
print(a+b)

//2
let line = readLine()!
let intArr = line.components(separatedBy: " ").map{ Int($0)! }
print(intArr.reduce(0, +))

//3
print((readLine()?.split(separator: " ").map { Int($0)! }.reduce(0, +))!)
