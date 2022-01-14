//
//  나누어 떨어지는 숫자 배열.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/14.
//

/*
 문제 설명
 array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.
 제한사항
 - arr은 자연수를 담은 배열입니다.
 - 정수 i, j에 대해 i ≠ j 이면 arr[i] ≠ arr[j] 입니다.
 - divisor는 자연수입니다.
 - array는 길이 1 이상인 배열입니다.
 */

print(solution([5,9,7,10], 5)) //[5,10]
print(solution([2,36,1,3], 1)) //[1,2,3,36]
print(solution([3,2,6],10)) //[-1]

//내답안
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var result = [Int]()
    for i in 0...arr.count-1 {
        if arr[i]%divisor == 0 {
            result.append(arr[i])
        }
    }
    return (result.count == 0) ? [-1] : result.sorted()
}

//모범답안
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let result = arr.filter { $0 % divisor == 0 }.sorted()
    return result.isEmpty ? [-1] : result
}
