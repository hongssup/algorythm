//
//  2798 블랙잭.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/04/28.
//

/*
 문제 :
 양의 정수가 쓰인 N장의 카드 중 M을 넘지 않으면서 M에 최대한 가까운 카드 3장의 합을 구해 출력하시오.
 입력 :
 첫째 줄에 카드의 개수 N(3 ≤ N ≤ 100)과 M(10 ≤ M ≤ 300,000)이 주어진다.
 둘째 줄에는 카드에 쓰여 있는 수가 주어지며, 이 값은 100,000을 넘지 않는 양의 정수이다.
 합이 M을 넘지 않는 카드 3장을 찾을 수 있는 경우만 입력으로 주어진다.
 출력 :
 첫째 줄에 M을 넘지 않으면서 M에 최대한 가까운 카드 3장의 합을 출력
 */

print(blackJack(5,21,[5,6,7,8,9])) //21
print(blackJack(10,500,[93,181,245,214,315,36,185,138,216,295])) //497

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input[0], m = input[1]
let cards = readLine()!.split(separator: " ").map{ Int($0)! }
print(blackJack(n,m,cards))

func blackJack(_ n: Int, _ m: Int, _ cards: [Int]) -> Int{
    var maxSum = 0
    for i in 0..<n {
        for j in i+1..<n {
            for k in j+1..<n {
                let sum = cards[i] + cards[j] + cards[k]
                if sum <= m && maxSum < sum {
                    maxSum = sum
                }
            }
        }
    }
    return maxSum
}
