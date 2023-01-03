//
//  2805 나무 자르기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/01/03.
//

/*
 문제
 나무 M미터 필요. 목재 절단기 높이 h 지정. 한 줄에 연속해있는 나무 모두 절단.
 20 15 10 17 -> h: 15 -> 15 15 10 15 -> 길이 5, 2 인 나무 들고 집에 갈 것 (총 7 미터)
 h : 0 ~ 양의 정수. 나무를 필요한 만큼만 집으로 가져갈 것.
 적어도 M 미터의 나무를 집에 가져가기 위해 절단기 설정 높이 최댓값 구하기
 입력
 첫줄 - 나무의 수 N, 가져가려는 나무 길이 M. 1 ≤ N ≤ 1,000,000, 1 ≤ M ≤ 2,000,000,000
 둘째줄 - 나무의 높이. M <= 나무 높이의 합. 0 ≤ 나무 높이 ≤ 1,000,000,000
 출력
 적어도 M미터의 나무를 집에 가져가기 위해서 절단기에 설정할 수 있는 높이의 최댓값을 출력한다.
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var trees = readLine()!.split(separator: " ").map { Int($0)! }

//145404KB 592ms
print(parametricSearch())

func parametricSearch() -> Int {
    var s = 0
    var e = trees.max()!
    var result = 0
    while s < e {
        let mid = (s + e)/2
        if treeToGo(mid) {
            result = mid
            s = mid + 1
        } else {
            e = mid
        }
    }
    return result
}

func treeToGo(_ h: Int) -> Bool {
    var sum = 0
    for i in trees {
        if (i - h) > 0 {
            sum += (i - h)
        }
    }
    return sum >= m
}
