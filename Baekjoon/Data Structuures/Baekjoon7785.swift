//
//  Baekjoon7785.swift
//  
//
//  Created by 임현규 on 2023/03/07.
//

import Foundation

let n = Int(readLine()!)!

var nameArray = Set<String>()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input[1] == "enter" {
        nameArray.insert(input[0])
    } else {
        nameArray.remove(input[0])
    }
}

nameArray.sorted { $0 > $1 }.forEach {
    print($0)
}
