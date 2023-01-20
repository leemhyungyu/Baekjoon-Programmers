//
//  Baekjoon18405.swift
//  
//
//  Created by 임현규 on 2023/01/20.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var examinerArray = [[Int]]()
var virusArray = [(Int, Int, Int, Int)]()

for _ in 1...n {
    examinerArray.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let lastInput = readLine()!.split(separator: " ").map { Int($0)! }
let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for i in 0...n - 1 {
    for j in 0...n - 1 {
        if examinerArray[i][j] != 0 {
            virusArray.append((examinerArray[i][j], i, j, 0))
        }
    }
}

var queue = virusArray.sorted { $0.0 < $1.0 }

while !queue.isEmpty {
    
    let temp = queue.removeFirst()
    let virus = temp.0, x = temp.1, y = temp.2, s = temp.3
    
    if s == lastInput[0] {
        break
    }
    
    for i in dxdy {
        let nx = x + i.0
        let ny = y + i.1
        
        if (0...n - 1).contains(nx) && (0...n - 1).contains(ny) {
            
            if examinerArray[nx][ny] == 0 {
                examinerArray[nx][ny] = virus
                queue.append((virus, nx, ny, s + 1))
            }
        }
    }
}

print(examinerArray[lastInput[1] - 1][lastInput[2] - 1])
