//
//  2775 부녀회장이 될테야.swift
//  algorythm
//
//  Created by SeoYeon Hong on 5/21/24.
//
//  https://www.acmicpc.net/problem/2775
//  Bronze 1

/*
 n의 최대가 14면 k의 최대도 14!!
 dp 먼저 저장해두고 입력값 받아오기
 */

// 보완 답안
var dp = Array(repeating: Array(0...14), count: 15)

for i in 1..<15 {
    for j in 2..<15 {
        dp[i][j] = dp[i-1][j] + dp[i][j-1]
    }
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    print(dp[k][n])
}


// 내 답안
let t = Int(readLine()!)!
var k = [Int]()
var n = [Int]()
for _ in 0..<t {
    k.append(Int(readLine()!)!)
    n.append(Int(readLine()!)!)
}

dp(k, n)

func dp(_ k: [Int], _ n: [Int]) {
    let maxK = k.max()!
    
    var dp = Array(repeating: Array(0...14), count: maxK + 1)
    for i in 1...maxK {
        for j in 1...14 {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    
    for i in 0..<k.count {
        print(dp[k[i]][n[i]])
    }
}
