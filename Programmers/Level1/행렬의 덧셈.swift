//
//  행렬의 덧셈.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/12.
//

/*
 문제 설명
 행렬의 덧셈은 행과 열의 크기가 같은 두 행렬의 같은 행, 같은 열의 값을 서로 더한 결과가 됩니다. 2개의 행렬 arr1과 arr2를 입력받아, 행렬 덧셈의 결과를 반환하는 함수, solution을 완성해주세요.
 제한 조건
 행렬 arr1, arr2의 행과 열의 길이는 500을 넘지 않습니다.
 */

print(solution([[1,2],[2,3]], [[3,4],[5,6]])) //[[4, 6], [7, 9]]

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr3:[[Int]] = []
    for i in 0...arr1.count-1 {
        arr3.append([])
        for j in 0...arr1[i].count-1 {
            arr3[i].append(arr1[i][j] + arr2[i][j])
        }
    }
    return arr3
}
