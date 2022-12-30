//
//  1920 수 찾기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/12/30.
//

/*
 문제 :
 N개의 정수 A[1], A[2], …, A[N]이 주어져 있을 때, 이 안에 X라는 정수가 존재하는지 알아내는 프로그램을 작성하시오.
 입력 :
 첫째 줄에 자연수 N(1 ≤ N ≤ 100,000)
 다음 줄에는 N개의 정수 A[1], A[2], …, A[N]
 다음 줄에는 M(1 ≤ M ≤ 100,000)
 다음 줄에는 M개의 수들이 주어지는데, 이 수들이 A안에 존재하는지 알아내면 된다.
 모든 정수의 범위는 -231 보다 크거나 같고 231보다 작다.
 출력 :
 M개의 줄에 답을 출력한다. 존재하면 1을, 존재하지 않으면 0을 출력한다.
 */

let N = Int(readLine()!)!
var nArray = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
let mArray = readLine()!.split(separator: " ").map { Int($0)! }

//시간초과 O(n^2)
for i in 0..<mArray.count {
    if nArray.contains(mArray[i]) {
        print(1)
    } else {
        print(0)
    }
}

//이진탐색 - 재귀함수
nArray = nArray.sorted()

for i in 0..<M {
    print(binarySearch(mArray[i], 0, N - 1))
}

func binarySearch(_ k: Int, _ s: Int, _ e: Int) -> Int {
    if s == e {
        if nArray[s] == k { return 1 }
        else { return 0 }
    }
    let mid = (s + e)/2
    if nArray[mid] >= k { return binarySearch(k, 0, mid) }
    else { return binarySearch(k, mid + 1, e) }
}

//이진탐색 - while 반복문
nArray.sort()

for i in 0..<M {
    print(binarySearch(mArray[i]))
}

func binarySearch(_ k: Int) -> Int {
    var start = 0
    var end = N - 1

    while start < end {
        let mid = (start + end)/2
        if nArray[mid] >= k {
            end = mid
        } else {
            start = mid + 1
        }
    }
    if nArray[start] == k { return 1 }
    else { return 0 }
}
