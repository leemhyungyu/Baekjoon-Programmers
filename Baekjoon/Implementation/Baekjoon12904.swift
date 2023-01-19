//
//  Baekjoon12904.swift
//  
//
//  Created by 임현규 on 2023/01/19.
//

import Foundation

let s = readLine()!.map { String($0) }
var t = readLine()!.map { String($0) }
var result = 0

while true {
    
    if t.last! == "A" {
        t.removeLast()
    } else {
        t.removeLast()
        t = t.reversed()
    }
        
    if t.count == s.count {
        if t == s {
            print(1)
            break
        } else {
            print(0)
            break
        }
    }
}
