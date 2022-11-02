//
//  숫자 짝꿍.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/10/27.
//

/*
 문제 설명
 두 정수 X, Y가 공통으로 가지는 정수 k(0 ≤ k ≤ 9) 들을 이용하여 만들 수 있는 가장 큰 정수를 두 수의 짝꿍이라 한다. 짝꿍이 존재하지 않으면 짝꿍은 -1. 짝꿍이 0으로만 구성되어 있다면, 짝꿍은 0.
 두 정수 X, Y가 주어졌을 때, X, Y의 짝꿍을 return하는 solution 함수를 완성해주세요.
 
 제한사항
 - 3 ≤ X, Y의 길이(자릿수) ≤ 3,000,000입니다.
 - X, Y는 0으로 시작하지 않습니다.
 - X, Y의 짝꿍은 상당히 큰 정수일 수 있으므로, 문자열로 반환합니다.
 */

import Foundation

print(solution("3403", "13203")) //330
print(solution("100", "2345")) //-1
print(solution("100", "203045")) //0
print(solution("12321", "42531")) //321

//내 답안
func solution(_ X:String, _ Y:String) -> String {

    var k = [String]()
    
    for i in 0...9 {
        let xCount = X.filter{ String($0) == String(i) }.count
        let yCount = Y.filter{ String($0) == String(i) }.count
        let count = min(xCount, yCount)
        k.append(contentsOf: Array(repeating: "\(i)", count: count))
    }
    k = k.reversed()
    k = Array(k.dropFirst(2))
    if (k.count > 0) && (k[0] == "0") { k = ["0"] }
    return (k.count > 0) ? k.joined(separator: "") : "-1"
}

//다른 답안
func solution(_ X:String, _ Y:String) -> String {
    
    var answer = ""
    var xNumberCount = Array(repeating: 0, count: 10)
    var yNumberCount = Array(repeating: 0, count: 10)
    for x in X {
        xNumberCount[Int(String(x))!] += 1
    }
    for y in Y {
        yNumberCount[Int(String(y))!] += 1
    }
    for number in stride(from: 9, through: 0, by: -1) {
        let minCount = min(xNumberCount[number], yNumberCount[number])
        if number == 0, 0 < minCount, answer.isEmpty {
            answer = "0"
            break
        }
        for _ in 0 ..< minCount {
            answer.append(String(number))
        }
    }
    return answer.isEmpty ? "-1" : answer
}
