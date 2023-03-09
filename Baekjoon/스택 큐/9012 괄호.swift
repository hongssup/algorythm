//
//  9012 괄호.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/03/08.
//

let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!
    print(isValidParenthesisString(input))
}

func isValidParenthesisString(_ input: String) -> String {
    var stack: [Character] = []

    for i in input {
        if i == "(" {
            stack.append(i)
        } else {
            if stack.last == "(" {
                stack.removeLast()
            } else {
                return "NO"
            }
        }
    }
    return stack.isEmpty ? "YES" : "NO"
}
