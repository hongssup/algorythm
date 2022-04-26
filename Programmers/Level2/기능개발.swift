//
//  기능개발.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/04/26.
//

/*
 문제 설명
 프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다. 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고, 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.
 제한 사항
 - 작업의 개수(progresses, speeds배열의 길이)는 100개 이하입니다.
 - 작업 진도는 100 미만의 자연수입니다.
 - 작업 속도는 100 이하의 자연수입니다.
 - 배포는 하루에 한 번만 할 수 있으며, 하루의 끝에 이루어진다고 가정합니다.예를 들어 진도율이 95%인 작업의 개발 속도가 하루에 4%라면 배포는 2일 뒤에 이루어집니다.
 */

import Foundation

print(solution([93,30,55], [1,30,5])) //[2,1]
print(solution([95,90,99,99,80,99], [1,1,1,1,1,1])) //[1,3,2]
print(solution([40, 93, 30, 55, 60, 65], [60, 1, 30, 5 , 10, 7])) //[1,2,3]
print(solution([93, 30, 55, 60, 40, 65], [1, 30, 5 , 10, 60, 7])) //[2,4]

//내답안
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var daysArr = [Int]()
    for i in 0..<progresses.count {
        var days = (100 - progresses[i]) / speeds[i]
        if !((100 - progresses[i]) % speeds[i] == 0) {
            days += 1
        }
        daysArr.append(days)
    }
    var result = [1]
    var index = 0
    for i in 1..<daysArr.count {
        if daysArr[i] > daysArr[i-1] {
            result.append(1)
            index += 1
        } else {
            daysArr[i] = daysArr[i-1]
            result[index] += 1
        }
    }
    return result
}

//다른풀이
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var daysArr = [Int]()
    var result = [Int]()
    for i in progresses.indices {
        daysArr.append((100 - progresses[i] - 1) / speeds[i] + 1)
    }
    var index = 0
    while index < daysArr.count {
        let longestTask = daysArr[index]
        var taskCnt = 0
        while index < daysArr.count && daysArr[index] <= longestTask {
            taskCnt += 1
            index += 1
        }
        result.append(taskCnt)
    }
    return result
}
