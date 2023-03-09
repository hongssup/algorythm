//
//  4949 균형잡힌 세상.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/03/08.
//

while let input = readLine(), input != "." {
    print(isBalanced(input))
}

func isBalanced(_ input: String) -> String {
    var stack: [Character] = []
    for i in input {
        switch i {
        case "(", "[":
            stack.append(i)
        case ")":
            if stack.last == "(" {
                stack.removeLast()
            } else {
                return "no"
            }
        case "]":
            if stack.last == "[" {
                stack.removeLast()
            } else {
                return "no"
            }
        default:
            break
        }
    }

    return stack.isEmpty ? "yes" : "no"
}
