//
//  11866 요세푸스 문제.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/03/28.
//

/*
 문제
 요세푸스 문제는 다음과 같다.
 1번부터 N번까지 N명의 사람이 원을 이루면서 앉아있고, 양의 정수 K(≤ N)가 주어진다. 이제 순서대로 K번째 사람을 제거한다. 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속해 나간다. 이 과정은 N명의 사람이 모두 제거될 때까지 계속된다. 원에서 사람들이 제거되는 순서를 (N, K)-요세푸스 순열이라고 한다. 예를 들어 (7, 3)-요세푸스 순열은 <3, 6, 2, 7, 5, 1, 4>이다.
 N과 K가 주어지면 (N, K)-요세푸스 순열을 구하는 프로그램을 작성하시오.
 입력
 첫째 줄에 N과 K가 빈 칸을 사이에 두고 순서대로 주어진다. (1 ≤ K ≤ N ≤ 1,000)
 출력
 7 3 -> <3, 6, 2, 7, 5, 1, 4>
 */

//큐 81212KB 24ms
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let K = input[1]
var queue: [Int?] = Array(1...N)
var result = [Int]()
var pointer = K-1

while result.count < N {
    for i in (pointer - (K-1))..<pointer {
        queue.append(queue[i])
        queue[i] = nil
    }
    result.append(queue[pointer]!)
    queue[pointer] = nil
    pointer += K
}
print("<\(result.map{String($0)}.joined(separator: ", "))>")

//단순구현 9104KB 12ms
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var arr = Array((1...input[0]))
var result = [Int]()
var now = 0

while !arr.isEmpty {
    now = (now + input[1]-1) % arr.count
    result.append(arr[now])
    arr.remove(at: now)
}
print("<" + result.map { String($0) }.joined(separator: ", ") + ">" )
