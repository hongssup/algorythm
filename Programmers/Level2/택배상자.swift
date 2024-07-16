//
//  택배상자.swift
//  algorythm
//
//  Created by SeoYeon Hong on 7/17/24.
//

/*
1 ~ n 크기는 모두 같고 일렬로 전달. (n <= 100만)
but 택배 배달 순서에 맞게 트럭에 실어야.
순서 아니면 보조 컨테이너 이용. 앞 뒤로 이동 가능 but 맨 앞의 상자만 뺄 수 있
(가장 마지막에 보관한 상자부터 꺼낼 수 있음)
순서대로 안되면 싣지 않음

4 3 1 2 5 -> 3 4 2 1 5 -> 1,2 2개
5 4 3 2 1 -> 1 2 3 4 5 -> 5개
1. 입력 값 받아오면 컨테이너 순서 먼저 구하기
    값의 index 를 해당 값 index 에 넣도록
2. 1번 택배가 나올 때 까지 보조 컨테이너에 보관
    1번 싣고 다음 혹은 뒤에 2가 나와야함. 아니면 종료
*/

print(solution([4,3,1,2,5]))
print(solution([1,2,3,4,5]))

func solution(_ order:[Int]) -> Int {
    var container = Array(repeating: 0, count: order.count) // 컨테이너 (앞에서부터)
    var sub = [Int]() // 보조 컨테이너 (뒤에서부터)
    var index = 1 // 실어야 하는 택배 순서
    
    for (i, num) in order.enumerated() {
        container[num - 1] = i + 1
    }
    
    for box in container {
        if box == index {
            index += 1
            while sub.count > 0 {
                if sub.last == index {
                    sub.popLast()
                    index += 1
                } else {
                    break
                }
            }
        } else {
            sub.append(box)
        }
    }
    
    return index - 1
}
