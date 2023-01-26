//
//  Baekjoon10610.swift
//  
//
//  Created by 임현규 on 2023/01/26.
//

import Foundation

var n = Array(readLine()!).map { Int(String($0))! }.sorted { $0 > $1 }
let number = n.reduce(0) { $0 + $1 }

if !n.contains(0) || number % 3 != 0 {
    print(-1)
} else {
    n.forEach {
        print($0, terminator: "")
    }
}
