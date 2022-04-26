//
//  10872 팩토리얼.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/04/27.
//

/*
 문제 : 0보다 크거나 같은 정수 N이 주어진다. N!을 출력하는 프로그램을 작성하시오.
 입력 : 정수 N(0 ≤ N ≤ 12)이 주어진다.
 입출력 예시 :
 10 -> 3628800
 0 -> 1
 */

//반복문
let input = Int(readLine()!)!
print(factorial(input))
func factorial(_ n: Int) -> Int {
    var result = 1
    if n > 1 {
        for i in 2...n {
            result *= i
        }
    }
    return result
}

//재귀함수
let input = Int(readLine()!)!
print(factorial(input))
func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    return n * factorial(n - 1)
}

//꼬리재귀
let input = Int(readLine()!)!
print(factorial(input, 1))
func factorial(_ n: Int, _ total: Int) -> Int {
    if n == 0 {
        return total
    }
    return factorial(n - 1, n * total)
}
