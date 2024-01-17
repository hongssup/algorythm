//
//  10870 피보나치수5.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/04/27.
//

/*
 문제 :
 피보나치 수는 0과 1로 시작한다. 0번째 피보나치 수는 0이고, 1번째 피보나치 수는 1이다. 그 다음 2번째 부터는 바로 앞 두 피보나치 수의 합이 된다.
 이를 식으로 써보면 Fn = Fn-1 + Fn-2 (n ≥ 2)가 된다.
 n=17일때 까지 피보나치 수를 써보면 다음과 같다.
 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597
 n이 주어졌을 때, n번째 피보나치 수를 구하는 프로그램을 작성하시오.
 입력 : 첫째 줄에 n이 주어진다. n은 20보다 작거나 같은 자연수 또는 0이다.
 출력 : 첫째 줄에 n번째 피보나치 수를 출력한다.
 입출력 예시 : 10 -> 55
 */

let input = Int(readLine()!)!
print(Fibonacci(input))

//재귀함수
func Fibonacci(_ n: Int) -> Int {
    if n == 0 { return 0 }
    else if n == 1 { return 1 }
    else {
        return Fibonacci(n - 1) + Fibonacci(n - 2)
    }
}

//재귀함수 축약
func Fibonacci(_ n: Int) -> Int {
    return n < 2 ? n : Fibonacci(n-1) + Fibonacci(n-2)
}

//반복문 1
func Fibonacci(_ n: Int) -> Int {
    var s1 = 0, s2 = 1, s3 = s1 + s2
    if n == 0 { return 0 }
    else if n == 1 { return 1 }
    else {
        for _ in 0..<n-1 {
            s3 = s1 + s2
            s1 = s2
            s2 = s3
        }
    return s3
    }
}

//반복문 2
func Fibonacci(_ n: Int) -> Int {
    var s1 = 0, s2 = 1
    for _ in 0..<n {
        let tmp = s1
        s1 = s2
        s2 = tmp + s2
    }
    return s1
}
