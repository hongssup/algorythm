//
//  키패드 누르기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/15.
//

/*
 문제 설명
 전화 키패드에서 왼손과 오른손의 엄지손가락만을 이용해서 숫자만을 입력하려고 합니다. 맨 처음 왼손 엄지손가락은 * 키패드에 오른손 엄지손가락은 # 키패드 위치에서 시작하며, 엄지손가락을 사용하는 규칙은 다음과 같습니다.
 1. 엄지손가락은 상하좌우 4가지 방향으로만 이동할 수 있으며 키패드 이동 한 칸은 거리로 1에 해당합니다.
 2. 왼쪽 열의 3개의 숫자 1, 4, 7을 입력할 때는 왼손 엄지손가락을 사용합니다.
 3. 오른쪽 열의 3개의 숫자 3, 6, 9를 입력할 때는 오른손 엄지손가락을 사용합니다.
 4. 가운데 열의 4개의 숫자 2, 5, 8, 0을 입력할 때는 두 엄지손가락의 현재 키패드의 위치에서 더 가까운 엄지손가락을 사용.
   4-1. 만약 두 엄지손가락의 거리가 같다면, 오른손잡이는 오른손 엄지손가락, 왼손잡이는 왼손 엄지손가락을 사용합니다.
 순서대로 누를 번호가 담긴 배열 numbers, 왼손잡이인지 오른손잡이인 지를 나타내는 문자열 hand가 매개변수로 주어질 때, 각 번호를 누른 엄지손가락이 왼손인 지 오른손인 지를 나타내는 연속된 문자열 형태로 return 하도록 solution 함수를 완성해주세요.

 제한사항
 - numbers 배열의 크기는 1 이상 1,000 이하입니다.
 - numbers 배열 원소의 값은 0 이상 9 이하인 정수입니다.
 - hand는 "left" 또는 "right" 입니다. "left"는 왼손잡이, "right"는 오른손잡이를 의미합니다.
 - 왼손 엄지손가락을 사용한 경우는 L, 오른손 엄지손가락을 사용한 경우는 R을 순서대로 이어붙여 문자열 형태로 return 해주세요.
 */

import Foundation

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")) //"LRLLLRLLRRL"
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left")) //"LRLLRRLLLRR"
print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right")) //"LLRLLRLLRL"

//내답안
func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypad = [[3,1],[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]  //keypad 좌표
    var current = [[3,0], [3,2]]  //왼손, 오른손 현재좌표
    var result = ""
    let hand = (hand == "left") ? 0 : 1
    
    for i in numbers {
        if [1,4,7].contains(i) {  //무조건 왼손
            current[0] = keypad[i]
            result += "L"
        } else if [3,6,9].contains(i) {  //무조건 오른손
            current[1] = keypad[i]
            result += "R"
        } else {
            //거리계산
            let leftD = abs(current[0][0]-keypad[i][0]) + abs(current[0][1]-keypad[i][1])  //왼손 거리
            let rightD = abs(current[1][0]-keypad[i][0]) + abs(current[1][1]-keypad[i][1])  //오른손 거리
            
            if leftD == rightD {
                current[hand] = keypad[i]
                result += (hand == 0) ? "L" : "R"
            } else if leftD < rightD {
                current[0] = keypad[i]
                result += "L"
            } else {
                current[1] = keypad[i]
                result += "R"
            }
        }
    }
    return result
}
