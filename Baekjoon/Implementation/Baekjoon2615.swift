//
//  Baekjoon2615.swift
//  
//
//  Created by 임현규 on 2023/01/10.
//

import Foundation

var omokArray = [[Int]]()
var direction = [[(0, -1), (0, 1)], [(-1, 0), (1, 0)], [(-1, -1), (1, 1)], [(-1, 1), (1, -1)]]
var indexArray = [(Int, Int)]()
var result = [(Int, Int)]()
var resultNumber = 0
var visited = [[Bool]]()

for _ in 1...19 {
    omokArray.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for x in 0...18 {
    for y in 0...18 {
        if omokArray[x][y] != 0 {
            for i in 0...3 {
                if checkOmok(k: i, xPos: x, yPos: y) {
                    resultNumber = omokArray[x][y]
                    result.append((indexArray.first!.0, indexArray.first!.1))
                    break
                }
            }
        }
    }
}

print(resultNumber)

if !result.isEmpty {
    result.sort { $0.1 < $1.1 ? $0.1 < $1.1 : $0.0 < $1.0 }
    print(result.first!.0 + 1, result.first!.1 + 1)
}

func checkOmok(k: Int, xPos: Int, yPos: Int) -> Bool {
    var count = 1
    indexArray.removeAll()
    var queue = [(xPos, yPos)]
    indexArray.append((xPos, yPos))
    visited = Array(repeating: Array(repeating: false, count: 19), count: 19)
    visited[xPos][yPos] = true
    
    while !queue.isEmpty {
        let xy = queue.removeFirst()
        
        let x = xy.0
        let y = xy.1
        
        for i in direction[k] {
            let nx = x + i.0
            let ny = y + i.1
            
            if (0...18).contains(nx) && (0...18).contains(ny) && !visited[nx][ny] {
                if omokArray[nx][ny] == omokArray[xPos][yPos] {
                    count += 1
                    visited[nx][ny] = true
                    indexArray.append((nx, ny))
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    if count == 5 {
        return true
    } else {
        return false
    }
}
