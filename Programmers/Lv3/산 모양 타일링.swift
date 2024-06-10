//
//  산 모양 타일링.swift
//  Solved
//
//  Created by 임현규 on 6/10/24.
//

import Foundation

func solution(_ n:Int, _ tops:[Int]) -> Int {
    let mod = 10007
    var square = Array(repeating: 0, count: n)
    var tri = Array(repeating: 0, count: n)
    
    if tops[0] == 0 {
        tri[0] = 2
        square[0] = 1
    } else {
        tri[0] = 3
        square[0] = 1
    }
    
    for i in 1..<n {
        let top = tops[i]
        square[i] = (tri[i - 1] + square[i - 1]) % mod
        if top == 0 {
            tri[i] = (square[i] + tri[i - 1]) % mod
        } else {
            tri[i] = (square[i] * 2 + tri[i - 1]) % mod
        }
    }
    
    return (square[n - 1] + tri[n - 1]) % 10007
}
