//
//  1874 스택 수열.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/03/11.
//

/*
 문제
 1부터 n까지의 수를 스택에 넣었다가 뽑아 늘어놓음으로써, 하나의 수열을 만들 수 있다. 이때, 스택에 push하는 순서는 반드시 오름차순을 지키도록 한다고 하자. 임의의 수열이 주어졌을 때 스택을 이용해 그 수열을 만들 수 있는지 없는지, 있다면 어떤 순서로 push와 pop 연산을 수행해야 하는지를 알아낼 수 있다. 이를 계산하는 프로그램을 작성하라.
 입력
 첫 줄에 n (1 ≤ n ≤ 100,000)이 주어진다. 둘째 줄부터 n개의 줄에는 수열을 이루는 1이상 n이하의 정수가 하나씩 순서대로 주어진다. 물론 같은 정수가 두 번 나오는 일은 없다.
 출력
 입력된 수열을 만들기 위해 필요한 연산을 한 줄에 한 개씩 출력한다. push연산은 +로, pop 연산은 -로 표현하도록 한다. 불가능한 경우 NO를 출력한다.
 */

// 70348 KB | 76 ms
let n = Int(readLine()!)!
var stack: [Int] = []
var result = ""
var i = 1

stack.append(i)
result += "+\n"

for _ in 0..<n {
    let input = Int(readLine()!)!
    if stack.isEmpty { push() }
    
    while input > stack.last! {
        push()
    }
    
    stack.popLast()
    result += "-\n"
}

func push() {
    i += 1
    stack.append(i)
    result += "+\n"
}

print(stack.isEmpty ? result : "NO")
