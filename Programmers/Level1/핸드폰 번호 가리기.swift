//
//  핸드폰 번호 가리기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/01/07.
//

//모범답안
func solution(_ phone_number:String) -> String {
    return String(repeating:"*", count:phone_number.count-4)+phone_number.suffix(4)
}

//내답안
func solution(_ phone_number:String) -> String {
    var arr = Array(phone_number)
    var arrr = [Character](repeating: "*", count: (arr.count-4))
    print(arrr)
    arr.removeFirst(arr.count-4)
    arrr += arr
    return String(arrr)
}

//실패답안
func solution(_ phone_number:String) -> String {
    for i in 0...(phone_number.count-5) {
        phone_number.replacingOccurrences(of: phone_number[i], with: "*")
    }
    return ""
}
