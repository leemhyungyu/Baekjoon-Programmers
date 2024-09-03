//
//  테이블 해시 함수.swift
//  Solved
//
//  Created by 임현규 on 9/3/24.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var data = data.sorted { $0[col - 1] == $1[col - 1] ? $0[0] > $1[0] : $0[col - 1] < $1[col - 1] }
    var result = 0
    
    (row_begin...row_end).forEach { i in
        result = result ^ data[i - 1].reduce(0) { $0 + $1 % i }
    }
    
    return result
}
