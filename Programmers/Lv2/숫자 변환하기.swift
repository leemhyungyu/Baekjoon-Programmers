//
//  숫자 변환하기.swift
//  
//
//  Created by 임현규 on 2023/04/11.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {

    var d = Array(repeating: 1000001, count: 10000001)
    d[x] = 0
    for i in x..<y + 1 {
        
        if i + n <= y {
            d[i + n] = min(d[i] + 1, d[i + n])

        }
        
        if i * 2 <= y {
            d[i * 2] = min(d[i] + 1, d[i * 2])

        }
        
        if i * 3 <= y {
            d[i * 3] = min(d[i] + 1, d[i * 3])
        }
    }
                
    if d[y] == 1000001 {
        return -1
    } else {
        return d[y]
    }
}
