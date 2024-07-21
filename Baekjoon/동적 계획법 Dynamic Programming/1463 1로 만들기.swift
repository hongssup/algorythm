//
//  1463 1로 만들기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 7/21/24.
//
//  https://www.acmicpc.net/problem/1463
//  Silver 3

/*
 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.
 */

// MARK: - 내 답안 76916KB 64ms
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)

for i in 1...n {
    if i < 4 {
        dp[i] = (i == 1) ? 0 : 1
        continue
    }
    var temp = [n, n, n]
    if i % 3 == 0 {
        temp[0] = dp[i/3] + 1
    }
    if i % 2 == 0 {
        temp[1] = dp[i/2] + 1
    }
    temp[2] = dp[i-1] + 1
    dp[i] = temp.min()!
}

print(dp[n])

// MARK: - 모범 답안 76916KB 20ms
if let n = Int(readLine()!) {
    var dp = Array(repeating: 0, count: n + 1)
    if n > 1 {
        for i in 2...n {
            dp[i] = dp[i - 1] + 1
            if i % 2 == 0 {
                dp[i] = min(dp[i], dp[i / 2] + 1)
            }
            if i % 3 == 0 {
                dp[i] = min(dp[i], dp[i / 3] + 1)
            }
        }
    }
    print(dp[n])
}
