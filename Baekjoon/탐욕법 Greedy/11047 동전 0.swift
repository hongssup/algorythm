//
//  11047 동전 0.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/04/11.
//

//69104KB 8ms
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
var k = input[1]
var coins = [Int]()
var result = 0

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

for coin in coins.reversed() {
    if k == 0 { break }
    result += k / coin
    k %= coin
}
print(result)
