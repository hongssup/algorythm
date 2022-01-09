//
//  x만큼 간격이 있는 n개의 숫자.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/08.
//

/*
 문제 설명
 함수 solution은 정수 x와 자연수 n을 입력 받아, x부터 시작해 x씩 증가하는 숫자를 n개 지니는 리스트를 리턴해야 합니다. 다음 제한 조건을 보고, 조건을 만족하는 함수, solution을 완성해주세요.
 제한 조건
 - x는 -10000000 이상, 10000000 이하인 정수입니다.
 - n은 1000 이하인 자연수입니다.
 */

print(solution(4,-4))  //[-4, -8, -12, -16]

//모범답안
func solution(_ x:Int, _ n:Int) -> [Int64] {
    var result = [Int64]()
    for i in 1...n {
        result.append(Int64(i * x))
    }
    return result
}

//고차함수 사용답안
func solution(_ x:Int, _ n:Int) -> [Int64] {
    return (1...n).map { Int64($0 * x) }
}

//내답안
func solution(_ x:Int, _ n:Int) -> [Int64] {
    var arr = [Int64]()
    var num = x
    for _ in 0...(n-1) {
        arr.append(Int64(num))
        num += x
    }
    return arr
}
