//
//  Baekjoon2563.swift
//  
//
//  Created by 임현규 on 2022/11/06.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    array.append(input)
}

var sqaureArray = [[Int]](repeating: Array(repeating: 0, count: 100), count: 100)

array.forEach { sqaure in
    
    for i in sqaure[0]...sqaure[0] + 9 {
        for j in sqaure[1]...sqaure[1] + 9 {
            if sqaureArray[i][j] == 0 {
                sqaureArray[i][j] = 1
            }
        }
    }
}

var result = 0

sqaureArray.forEach { array in
    for i in array {
        if i == 1 {
            result += 1
        }
    }
}

print(result)
