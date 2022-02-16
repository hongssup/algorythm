//
//  비밀지도.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/16.
//

/*
 문제 설명
 지도는 한 변의 길이가 n인 정사각형 배열 형태로, 각 칸은 "공백"(" ") 또는 "벽"("#") 두 종류로 이루어져 있다.전체 지도는 두 장의 지도를 겹쳐서 얻을 수 있다. 각각 "지도 1"과 "지도 2"라고 하자. 지도 1 또는 지도 2 중 어느 하나라도 벽인 부분은 전체 지도에서도 벽이다. 지도 1과 지도 2에서 모두 공백인 부분은 전체 지도에서도 공백이다."지도 1"과 "지도 2"는 각각 정수 배열로 암호화되어 있다.암호화된 배열은 지도의 각 가로줄에서 벽 부분을 1, 공백 부분을 0으로 부호화했을 때 얻어지는 이진수에 해당하는 값의 배열이다.
 비밀지도의 암호를 해독하는 작업을 도와줄 프로그램을 작성하라.
 입력 형식
 입력으로 지도의 한 변 크기 n 과 2개의 정수 배열 arr1, arr2가 들어온다.
 - 1 ≦ n ≦ 16
 - arr1, arr2는 길이 n인 정수 배열로 주어진다.
 - 정수 배열의 각 원소 x를 이진수로 변환했을 때의 길이는 n 이하이다. 즉, 0 ≦ x ≦ 2n제곱 - 1을 만족한다.
 출력 형식
 원래의 비밀지도를 해독하여 '#', 공백으로 구성된 문자열 배열로 출력하라.
 */

print(solution(5,[9, 20, 28, 18, 11],[30, 1, 21, 17, 28])) //["#####","# # #", "### #", "# ##", "#####"]
print(solution(6,[46, 33, 33 ,22, 31, 50],[27 ,56, 19, 14, 14, 10])) //["######", "### #", "## ##", " #### ", " #####", "### # "]

//내답안
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    var arr1 = arr1.map{ String($0, radix: 2).map{ $0 } }
    var arr2 = arr2.map{ String($0, radix: 2).map{ $0 } }
    
    for i in 0..<n {
        while arr1[i].count < n { arr1[i].insert("0", at: 0) }
        while arr2[i].count < n { arr2[i].insert("0", at: 0) }
        
        var s = ""
        for j in 0..<n {
            if arr1[i][j] == "1" { s += "#" }
            else { s += arr2[i][j] == "1" ? "#" : " " }
        }
        answer.append(s)
    }
    return answer
}

//다른답안
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map { String(String(arr1[$0]|arr2[$0]|2<<(n - 1), radix: 2).map { $0 == "1" ? "#" : " " }[1...n]) }
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        let binary = String(arr1[$0] | arr2[$0], radix: 2)
        let padded = String(repeating: "0", count: n - binary.count) + binary
        return padded.reduce("") { $0 + ($1 == "0" ? " " : "#") }
    }
}
