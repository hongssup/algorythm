//
//  영어 끝말잇기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/11/04.
//

/*
 문제 설명
 n명의 사람이 영어 끝말잇기를 한다. 사람의 수 n과 사람들이 순서대로 말한 단어 words 가 매개변수로 주어질 때, 가장 먼저 탈락하는 사람의 번호와 그 사람이 자신의 몇 번째 차례에 탈락하는지를 구해서 return 하도록 solution 함수를 완성해주세요.
 제한 사항
 - 끝말잇기에 참여하는 사람의 수 n은 2 이상 10 이하의 자연수입니다.
 - words는 끝말잇기에 사용한 단어들이 순서대로 들어있는 배열이며, 길이는 n 이상 100 이하입니다.
 - 단어의 길이는 2 이상 50 이하입니다.
 - 정답은 [ 번호, 차례 ] 형태로 return 해주세요.
 - 만약 주어진 단어들로 탈락자가 생기지 않는다면, [0, 0]을 return 해주세요.
*/

import Foundation

print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])) //[3, 3]
print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])) //[0, 0]
print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])) //[1, 3]

//내답안
func solution(_ n:Int, _ words:[String]) -> [Int] {
    var game = [Int:[String]]()
    var num = 1
    var letter = words[0].prefix(1)
    var wordsList = [String]()
    
    for i in words {
        if game[num] != nil {
            game[num]!.append(i)
        } else {
            game[num] = [i]
        }
        //끝말잇기 & 단어중복체크
        if !i.hasPrefix(String(letter)) || wordsList.contains(i) {
            return [num, game[num]!.count]
        } else {
            letter = i.suffix(1)
            wordsList.append(i)
        }
        num = (num == n) ? 1 : num + 1
    }
    return [0, 0]
}

//보완답안
func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordsList = [String]()
    var letter = words[0].first
    for i in words {
        if wordsList.contains(i) || i.first == letter {
            return [(wordsList.count % n) + 1, wordsList.count / n + 1]
        } else {
            letter = i.last
            wordsList.append(i)
        }
    }
    return [0, 0]
}
