//
//  뉴스 클러스터링.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/11.
//

/*
 문제 설명
 유사한 기사를 묶는 기준을 정하기 위해서 논문과 자료를 조사하던 튜브는 "자카드 유사도"라는 방법을 찾아냈다.
 자카드 유사도는 집합 간의 유사도를 검사하는 여러 방법 중의 하나로 알려져 있다. 두 집합 A, B 사이의 자카드 유사도 J(A, B)는 두 집합의 교집합 크기를 두 집합의 합집합 크기로 나눈 값으로 정의된다.
 예를 들어 집합 A = {1, 2, 3}, 집합 B = {2, 3, 4}라고 할 때, 교집합 A ∩ B = {2, 3}, 합집합 A ∪ B = {1, 2, 3, 4}이 되므로, 집합 A, B 사이의 자카드 유사도 J(A, B) = 2/4 = 0.5가 된다. 집합 A와 집합 B가 모두 공집합일 경우에는 나눗셈이 정의되지 않으니 따로 J(A, B) = 1로 정의한다.
 자카드 유사도는 원소의 중복을 허용하는 다중집합에 대해서 확장할 수 있다. 다중집합 A는 원소 "1"을 3개 가지고 있고, 다중집합 B는 원소 "1"을 5개 가지고 있다고 하자. 이 다중집합의 교집합 A ∩ B는 원소 "1"을 min(3, 5)인 3개, 합집합 A ∪ B는 원소 "1"을 max(3, 5)인 5개 가지게 된다. 다중집합 A = {1, 1, 2, 2, 3}, 다중집합 B = {1, 2, 2, 4, 5}라고 하면, 교집합 A ∩ B = {1, 2, 2}, 합집합 A ∪ B = {1, 1, 2, 2, 3, 4, 5}가 되므로, 자카드 유사도 J(A, B) = 3/7, 약 0.42가 된다.
 이를 이용하여 문자열 사이의 유사도를 계산하는데 이용할 수 있다. 문자열 "FRANCE"와 "FRENCH"가 주어졌을 때, 이를 두 글자씩 끊어서 다중집합을 만들 수 있다. 각각 {FR, RA, AN, NC, CE}, {FR, RE, EN, NC, CH}가 되며, 교집합은 {FR, NC}, 합집합은 {FR, RA, AN, NC, CE, RE, EN, CH}가 되므로, 두 문자열 사이의 자카드 유사도 J("FRANCE", "FRENCH") = 2/8 = 0.25가 된다.
 입력 형식
 - 입력으로는 str1과 str2의 두 문자열이 들어온다. 각 문자열의 길이는 2 이상, 1,000 이하이다.
 - 입력으로 들어온 문자열은 두 글자씩 끊어서 다중집합의 원소로 만든다. 이때 영문자로 된 글자 쌍만 유효하고, 기타 공백이나 숫자, 특수 문자가 들어있는 경우는 그 글자 쌍을 버린다. 예를 들어 "ab+"가 입력으로 들어오면, "ab"만 다중집합의 원소로 삼고, "b+"는 버린다.
 - 다중집합 원소 사이를 비교할 때, 대문자와 소문자의 차이는 무시한다. "AB"와 "Ab", "ab"는 같은 원소로 취급한다.
 출력 형식
 입력으로 들어온 두 문자열의 자카드 유사도를 출력한다. 유사도 값은 0에서 1 사이의 실수이므로, 이를 다루기 쉽도록 65536을 곱한 후에 소수점 아래를 버리고 정수부만 출력한다.
*/

import Foundation

print(solution("FRANCE", "french")) //16384
print(solution("handshake", "shake hands")) //16384
print(solution("aa1+aa2", "AAAA12")) //43690
print(solution("E=M*C^2", "e=m*c^2")) //65536

//내답안
func solution(_ str1:String, _ str2:String) -> Int {
    //다중집합 원소 만들기
    func letterSet(_ str: String) -> [String] {
        var str = str.lowercased()
        var arr = [String]()
        while str.count > 1 {
            var letter = ""
            for i in str.prefix(2) {
                if i.isLetter {
                    letter += String(i)
                }
            }
            if letter.count == 2 {
                arr.append(letter)
            }
            str = String(str.dropFirst())
        }
        return arr
    }
    
    let arr1 = letterSet(str1)
    let arr2 = letterSet(str2)
    
    if arr1.count == 0 && arr2.count == 0 { return 65536 }
    
    //교집합 구하기
    var intersection = 0
    let inter = arr1.filter{ arr2.contains($0) }

    for i in Set(inter) {
        let count1 = arr1.filter{ $0 == i }.count
        let count2 = arr2.filter{ $0 == i }.count
        intersection += min(count1, count2)
    }
    //합집합 구하기
    let union = arr1.count + arr2.count - intersection
    
    let result = 65536 * Double(intersection) / Double(union)
    return Int(result)
}

//보완답안
func solution(_ str1:String, _ str2:String) -> Int {
    //다중집합 원소 만들기
    func letterSet(_ str: String) -> [String] {
        let str = str.map{ $0.lowercased() }
        var arr = [String]()
        for i in 0..<str.count - 1 {
            if Character(str[i]).isLetter && Character(str[i+1]).isLetter {
                arr.append(str[i] + str[i+1])
            }
        }
        return arr
    }
    
    let arr1 = letterSet(str1)
    let arr2 = letterSet(str2)
    
    if arr1.count == 0 && arr2.count == 0 { return 65536 }
    
    //교집합 구하기
    var intersection = 0
    for i in Set(arr1).intersection(Set(arr2)) {
        let count1 = arr1.filter{ $0 == i }.count
        let count2 = arr2.filter{ $0 == i }.count
        intersection += min(count1, count2)
    }
    //합집합 구하기
    let union = arr1.count + arr2.count - intersection
    
    let result = Double(intersection) / Double(union) * 65536
    print("union: \(union), inter: \(intersection), result: \(result)")
    return Int(result)
}
