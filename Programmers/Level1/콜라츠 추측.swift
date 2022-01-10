//
//  콜라츠 추측.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/10.
//

/*
 문제 설명
 1-1. 입력된 수가 짝수라면 2로 나눕니다.
 1-2. 입력된 수가 홀수라면 3을 곱하고 1을 더합니다.
 2. 결과로 나온 수에 같은 작업을 1이 될 때까지 반복합니다.
 이 작업을 몇번이나 반복해야하는지 반환하는 함수.
 500번을 반복해도 1이 되지 않으면 -1을 반환
 제한조건
  - num은 1 이상, 8000000 미만인 정수입니다.
 */

print(solution(6)) //8
print(solution(16)) //4
print(solution(626331)) //-1
print(solution(1)) //0

func solution(_ num:Int) -> Int {
    if num == 1 { return 0 }
    var num = num
    for i in 1...500 {
        num = (num % 2 == 0) ? num/2 : num*3 + 1
        if num == 1 { return i }
    }
    return -1
}
