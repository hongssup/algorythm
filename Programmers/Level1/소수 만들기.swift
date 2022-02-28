//
//  소수 만들기.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2022/02/28.
//

/*
 문제 설명
 주어진 숫자 중 3개의 수를 더했을 때 소수가 되는 경우의 개수를 구하려고 합니다. 숫자들이 들어있는 배열 nums가 매개변수로 주어질 때, nums에 있는 숫자들 중 서로 다른 3개를 골라 더했을 때 소수가 되는 경우의 개수를 return 하도록 solution 함수를 완성해주세요.
 제한사항
 nums에 들어있는 숫자의 개수는 3개 이상 50개 이하입니다. nums의 각 원소는 1 이상 1,000 이하의 자연수이며, 중복된 숫자가 들어있지 않습니다.
 */

import Foundation

print(solution([1,2,3,4])) //1
print(solution([1,2,7,6,4])) //4

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    //소수 판별 함수
    func isPrime(num: Int) -> Bool {
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 { return false }
        }
        return true
    }
    
    //서로 다른 숫자 3개 고르기
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                //합이 소수인지 판별
                if isPrime(num: nums[i] + nums[j] + nums[k]) { answer += 1 }
            }
        }
    }
    return answer
}
