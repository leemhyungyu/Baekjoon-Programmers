//
//  최솟값 만들기.swift
//  BackJoon
//
//  Created by 임현규 on 2022/11/22.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var a = A
    var b = B
    
    var ans = 0
    
    a.sort { $0 < $1 }
    b.sort { $1 < $0 }
    
    for i in 0...a.count - 1 {
        ans += a[i] * b[i]
    }
    return ans
}
