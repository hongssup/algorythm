//
//  신규 아이디 추천.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/05.
//

/*
 1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
 2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
      만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
 7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
 
 [문제]
 신규 유저가 입력한 아이디를 나타내는 new_id가 매개변수로 주어질 때, "네오"가 설계한 7단계의 처리 과정을 거친 후의 추천 아이디를 return 하도록 solution 함수를 완성해 주세요.
 [제한사항]
 new_id는 길이 1 이상 1,000 이하인 문자열입니다.new_id는 알파벳 대문자, 알파벳 소문자, 숫자, 특수문자로 구성되어 있습니다.new_id에 나타날 수 있는 특수문자는 -_.~!@#$%^&*()=+[{]}:?,<>/ 로 한정됩니다.
 */

import Foundation

print(solution("...!@BaT#*..y.abcdefghijklm")) //bat.y.abcdefghi
print(solution("z-+.^.")) //z--
print(solution("=.=")) //aaa
print(solution("abcdefghijklmn.p")) //abcdefghijklmn

//내답안
func solution(_ new_id:String) -> String {
    var new_id = new_id.lowercased()
    let char = "~!@#$%^&*()=+[{]}:?,<>/"
    for i in new_id {
        if char.contains(i) { new_id.remove(at: new_id.firstIndex(of: i)!) }
    }
    while new_id.contains("..") {
        new_id = new_id.replacingOccurrences(of: "..", with: ".")
    }
    var arr = Array(new_id)
    if arr[0] == "." { arr.removeFirst() }
    if arr.isEmpty { arr.append("a") }
    if arr.count >= 16 { arr = arr.dropLast(arr.count-15) }
    if arr.last == "." { arr.removeLast() }
    if arr.count <= 2 {
        for i in 0..<3-arr.count {
            arr.append(arr.last!)
        }
    }
    return String(arr)
}

//모범답안
func solution(_ new_id:String) -> String {
    var new_id = new_id.lowercased()
    new_id = new_id.filter{$0.isNumber || $0.isLetter || $0 == "-" || $0 == "_" || $0 == "."}
    while new_id.contains("..") {
        new_id = new_id.replacingOccurrences(of: "..", with: ".")
    }
    if new_id.hasPrefix(".") { new_id.removeFirst() }
    if new_id.isEmpty { new_id = "a" }
    if new_id.count >= 16 { new_id = String(new_id.prefix(15)) }
    if new_id.hasSuffix(".") { new_id.removeLast() }
    while new_id.count < 3 {
        new_id += String(new_id.last!)
    }
    return new_id
}
