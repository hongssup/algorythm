//
//  10816 숫자 카드 2.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/01.
//

/*
 문제
 숫자 카드는 정수 하나가 적혀져 있는 카드이다. 상근이는 숫자 카드 N개를 가지고 있다. 정수 M개가 주어졌을 때, 이 수가 적혀있는 숫자 카드를 상근이가 몇 개 가지고 있는지 구하는 프로그램을 작성하시오.
 입력
 첫째 줄에 상근이가 가지고 있는 숫자 카드의 개수 N(1 ≤ N ≤ 500,000)이 주어진다.
 둘째 줄에는 숫자 카드에 적혀있는 정수가 주어진다. -10,000,000 ≤ 숫자 카드에 적혀있는 수 ≤ 10,000,000
 셋째 줄에는 M(1 ≤ M ≤ 500,000)이 주어진다.
 넷째 줄에는 상근이가 몇 개 가지고 있는 숫자 카드인지 구해야 할 M개의 정수가 주어지며, 이 수는 공백으로 구분되어져 있다. 이 수도 -10,000,000보다 크거나 같고, 10,000,000보다 작거나 같다.
 출력
 첫째 줄에 입력으로 주어진 M개의 수에 대해서, 각 수가 적힌 숫자 카드를 상근이가 몇 개 가지고 있는지를 공백으로 구분해 출력한다.
 */

let N = Int(readLine()!)!
let nArray = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
let mArray = readLine()!.split(separator: " ").map { Int($0)! }

//해시 126912KB 656ms
var dict = [Int:Int]()
var result = [Int]()

for num in nArray {
    dict.updateValue((dict[num] ?? 0) + 1, forKey: num)
}

for num in mArray {
    result.append(dict[num] ?? 0)
}

print(result.map{ String($0) }.joined(separator: " "))

//이분탐색 - while 반복문 113900KB 748ms
nArray.sort()
var result = [Int]()

for num in mArray {
    let s = lowerBound(nArray, num)
    let e = upperBound(nArray, num)
    result.append(e - s)
}
print(result.map{ String($0) }.joined(separator: " "))

func lowerBound(_ arr: [Int], _ k: Int) -> Int {
    var s = 0
    var e = arr.count

    while s < e {
        let mid = (s + e)/2
        if arr[mid] < k {
            s = mid + 1
        } else {
            e = mid
        }
    }
    return s
}

func upperBound(_ arr: [Int], _ k: Int) -> Int {
    var s = 0
    var e = arr.count

    while s < e {
        let mid = (s + e)/2
        if arr[mid] <= k {
            s = mid + 1
        } else {
            e = mid
        }
    }
    return s
}
