//
//  Baekjoon7568.swift
//  
//
//  Created by 임현규 on 2022/10/06.
//

import Foundation

struct body {
    var weight: Int
    var heigth: Int
}

let n = Int(readLine()!)!

var bodyArr = [body]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    bodyArr.append(body(weight: input[0], heigth: input[1]))
}

for i in 0...bodyArr.count - 1 {
    var result = 1
    for j in 0...bodyArr.count - 1 {
        if bodyArr[i].weight < bodyArr[j].weight && bodyArr[i].heigth < bodyArr[j].heigth {
            result += 1
        }
    }
    
    print(result, terminator: " ")
}
