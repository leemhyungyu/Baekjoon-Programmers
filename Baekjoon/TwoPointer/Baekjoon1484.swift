//
//  Baekjoon1484.swift
//  Solved
//
//  Created by 임현규 on 7/5/24.
//

import Foundation

let g = Int(readLine()!)!

func solution(_ g: Int) -> [Int] {
    
    var result = [Int]()
    var n = 2, r = 1
    
    while n != r {
        let n2 = n * n, r2 = r * r
        
        if n2 - r2 > g {
            r += 1
        } else {
            if n2 - r2 == g { result.append(n) }
            n += 1
        }
    }
    
    return result.sorted()
}

solution(g).forEach { print($0) }
