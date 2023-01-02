//
//  1654 랜선 자르기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/02.
//

/*
 문제
 자체적으로 K개의 랜선을 가지고 있다. 그러나 K개의 랜선은 길이가 제각각이다. 랜선을 모두 N개의 같은 길이의 랜선으로 만들고 싶기 때문에 K개의 랜선을 잘라서 만들어야 한다. 예를 들어 300cm 짜리 랜선에서 140cm 짜리 랜선을 두 개 잘라내면 20cm는 버려야 한다. (이미 자른 랜선은 붙일 수 없다.) 편의를 위해 랜선을 자르거나 만들 때 손실되는 길이는 없다고 가정하며, 기존의 K개의 랜선으로 N개의 랜선을 만들 수 없는 경우는 없다고 가정하자. 그리고 자를 때는 항상 센티미터 단위로 정수길이만큼 자른다고 가정하자. N개보다 많이 만드는 것도 N개를 만드는 것에 포함된다. 이때 만들 수 있는 최대 랜선의 길이를 구하는 프로그램을 작성하시오.
 출력
 N개를 만들 수 있는 랜선의 최대 길이를 센티미터 단위의 정수로 출력한다.
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let k = input[0]
let n = input[1]
var lan = [Int]()
for _ in 0..<k {
    lan.append(Int(readLine()!)!)
}

var min = 0
var max = lan.max()! + 1

while min < max {
    let mid = (min + max)/2

    let count = lan.map { $0/mid }.reduce(0, +)
    if count >= n {
        min = mid + 1
    } else {
        max = mid
    }
}
print(min - 1)
