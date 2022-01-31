//
//  시저 암호.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/31.
//

/*
 문제 설명
 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 "AB"는 1만큼 밀면 "BC"가 되고, 3만큼 밀면 "DE"가 됩니다. "z"는 1만큼 밀면 "a"가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.

 제한 조건
 공백은 아무리 밀어도 공백입니다.
 s는 알파벳 소문자, 대문자, 공백으로만 이루어져 있습니다.
 s의 길이는 8000이하입니다.
 n은 1 이상, 25이하인 자연수입니다.
 */

print(solution("AB", 1)) //"BC"
print(solution("z", 1)) //"a"
print(solution("a B z", 4)) //"e F d"

//내답안
func solution(_ s:String, _ n:Int) -> String {
    let abc = "abcdefghijklmnopqrstuvwxyz"
    let ABC = abc.uppercased()
    var result = ""

    for i in s {
        if i == " " {
            result += " "
        } else if abc.contains(i) {
            if abc.count <= Array(abc).firstIndex(of: i)! + n {
                result += String(Array(abc)[Array(abc).firstIndex(of: i)! + n - abc.count])
            } else {
                result += String(Array(abc)[Array(abc).firstIndex(of: i)! + n])
            }
        } else {
            if ABC.count <= Array(ABC).firstIndex(of: i)! + n {
                result += String(Array(ABC)[Array(ABC).firstIndex(of: i)! + n - ABC.count])
            } else {
                result += String(Array(ABC)[Array(ABC).firstIndex(of: i)! + n])
            }
        }
    }
    return result
}

//모범답안
func solution(_ s:String, _ n:Int) -> String {
    let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
    return String(s.map {
        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alphabets[(index + n) % alphabets.count]
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}
