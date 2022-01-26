//
//  수박수박수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/26.
//

/*
 문제 설명
 길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, solution을 완성하세요. 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.

 제한 조건
 n은 길이 10,000이하인 자연수입니다.
 */

print(solution(3)) //수박수

func solution(_ n:Int) -> String {
    var arr = [String]()
    for i in 1...n {
        (i%2 == 0) ? arr.append("박") : arr.append("수")
    }
    return arr.joined()
}

func solution(_ n:Int) -> String {
    var str = ""
    for i in 1...n {
        str += i % 2 == 1 ? "수" : "박"
    }
    return str
}

func solution(_ n:Int) -> String {
    var ans = String(repeating: "수박", count: n/2)
    return ans + ((n%2==1) ? "수" : "")
}
