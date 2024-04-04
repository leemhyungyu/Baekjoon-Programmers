//
//  Baekjoon2630.swift
//  Solved
//
//  Created by 임현규 on 2024/04/04.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
var dxdy = [(0, 0), (1, 0), (0, 1), (1, 1)]
var whiteCount = 0, blueCount = 0
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func separator(_ array: inout [[Int]], _ start: (Int, Int), _ size: Int) {
    
    guard let color = check(&array, start, size) else {
        for i in dxdy {
            separator(&array, (start.0 + size / 2 * i.0, start.1 + size / 2 * i.1), size / 2)
        }
        
        return
    }
    
    if color == 1 {
        blueCount += 1
    } else {
        whiteCount += 1
    }
}


func check(_ array: inout [[Int]], _ start: (Int, Int), _ size: Int) -> Int? {
    let color = array[start.0][start.1]
    var isEqual = true
    
    for i in start.0..<start.0 + size {
        for j in start.1..<start.1 + size {
            if array[i][j] == color { continue }
            isEqual = false
        }
    }
    return isEqual ? color : nil
}

separator(&array, (0, 0), n)
print(whiteCount)
print(blueCount)
