//
//  2231 분해합.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/04/28.
//

/*
 문제 :
 어떤 자연수 N이 있을 때, 그 자연수 N의 분해합은 N과 N을 이루는 각 자리수의 합을 의미한다. 어떤 자연수 M의 분해합이 N인 경우, M을 N의 생성자라 한다. 예를 들어, 245의 분해합은 256(=245+2+4+5)이 된다. 따라서 245는 256의 생성자가 된다. 물론, 어떤 자연수의 경우에는 생성자가 없을 수도 있다. 반대로, 생성자가 여러 개인 자연수도 있을 수 있다.
 자연수 N이 주어졌을 때, N의 가장 작은 생성자를 구해내는 프로그램을 작성하시오.
 입력 :
 첫째 줄에 자연수 N(1 ≤ N ≤ 1,000,000)이 주어진다.
 출력 :
 첫째 줄에 답을 출력한다. 생성자가 없는 경우에는 0을 출력한다.
 */

print(minGenerator(216)) //198

let n = Int(readLine()!)!
print(minGenerator(n))

func minGenerator(_ n: Int) -> Int {
    for i in n-String(n).count*9..<n {
        var sum = i
        for j in String(i) {
            sum += Int(String(j))!
        }
        if sum == n {
            return i
        }
    }
    return 0
}

//2차시도 69100KB 8ms
func minGenerator(_ n: Int) -> Int {
    let tmp = Int(String(String(n).first!))! + 9 * (String(n).count - 1)
    for i in n-tmp..<n {
        var sum = i
        for j in String(i) {
            sum += Int(String(j))!
        }
        if sum == n {
            return i
        }
    }
    return 0
}

//1차시도 69100KB 296ms
func minGenerator(_ n: Int) -> Int {
    for i in 1...n {
        var sum = i
        for j in String(i) {
            sum += Int(String(j))!
        }
        if sum == n {
            return i
        }
    }
    return 0
}
