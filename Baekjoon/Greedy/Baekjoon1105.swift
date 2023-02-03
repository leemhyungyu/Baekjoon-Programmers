//
//  Baekjoon1105.swift
//  
//
//  Created by 임현규 on 2023/02/03.
//

import Foundation

let input = readLine()!.split(separator:  " ").map { String($0).map { String($0)} }
var l = input[0].map { Int($0)! }
var r = input[1].map { Int($0)! }
var result = 0
var isSame = true

if r.count > l.count {
    result = 0
} else {
    for i in 0...l.count - 1 {
        if i == 0 {
            if l[i] == 8 && r[i] == 8 {
                result += 1
            } else if l[i] != r[i]{
                isSame = false
            }
        } else {
            if l[i] == 8 && r[i] == 8 && isSame {
                result += 1
            } else if l[i] != r[i] {
                isSame = false
            }
        }
    }
}

print(result)
