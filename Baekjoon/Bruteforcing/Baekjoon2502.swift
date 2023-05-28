//
//  Baekjoon2502.swift
//  
//
//  Created by 임현규 on 2023/05/28.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let day = input[0], count = input[1]
var da = Array(repeating: 0, count: 31)
var db = Array(repeating: 0, count: 31)

var result = 0

func solution(_ day: Int, _ count: Int) {
    
    var a = 0
    var b = 0
    
    da[1] = 1
    db[1] = 0
    
    da[2] = 0
    db[2] = 1
    
   
    for i in 3..<day + 1 {
        da[i] = db[i - 1]
        db[i] = db[i - 1] + da[i - 1]
    }

    a = 1
    
    while da[day] * a < count {
        
        if (count - (da[day] * a)) % db[day] == 0 {
            b = (count - (da[day] * a)) / db[day]
            break
        } else {
            a += 1
        }
    }
    
    [a, b].forEach {
        print($0)
    }
}

solution(day, count)
