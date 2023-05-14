//
//  2600. K Items With the Maximum Sum.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2023/05/14.
//

class Solution {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        return min(k, numOnes) - max(0, k - numOnes - numZeros)
    }
}

class Solution {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        if numOnes >= k {
            return k
        } else if numOnes + numZeros >= k {
            return numOnes
        } else {
            return numOnes - (k - numOnes - numZeros)
        }
    }
}
