//
//  문자열 내 p와 y의 개수.swift
//  algorythm
//
//  Created by SeoYeon Hong on 2021/04/12.
//

import Foundation

func solution(_ s:String) -> Bool
{
    let lower = s.lowercased()
    var pcount = 0
    var ycount = 0
    for i in lower {
        if i == "p" { pcount += 1 }
        else if i == "y" { ycount += 1 }
    }
    
    return pcount == ycount
}
