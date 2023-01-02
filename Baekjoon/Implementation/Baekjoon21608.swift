//
//  Baekjoon21608.swift
//  
//
//  Created by 임현규 on 2023/01/02.
//

import Foundation

let n = Int(readLine()!)!

var studentOrder = [Int]()
var friendsArray = [[Int]]()
var result = 0

for _ in 0...(n * n) - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    studentOrder.append(input[0])
    friendsArray.append([input[1], input[2], input[3], input[4]])
}

var array = Array(repeating: Array(repeating: 0, count: n), count: n)

var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for i in 0...studentOrder.count - 1 {
    
    var selectedEmpty = -1, selectedLike = -1, selectedX = 0, selectedY = 0
    
    for x in 0...n - 1 {
        for y in 0...n - 1 {
            
            if array[x][y] == 0 {
                var emptyCount = 0, likeCount = 0

                for j in dxdy {
                    let nx = x + j.0
                    let ny = y + j.1
                    
                    if (0...n - 1).contains(nx) && (0...n  - 1).contains(ny) {
                        if array[nx][ny] == 0 {
                            emptyCount += 1
                        }
                        
                        if friendsArray[i].contains(array[nx][ny]) {
                            likeCount += 1
                        }
                    }
                }
                
                if likeCount > selectedLike {
                    selectedLike = likeCount
                    selectedEmpty = emptyCount
                    selectedX = x
                    selectedY = y
                    
                } else if likeCount == selectedLike {
                    if emptyCount > selectedEmpty {
                        selectedEmpty = emptyCount
                        selectedX = x
                        selectedY = y

                    }
                }
            }
        }
    }

    array[selectedX][selectedY] = studentOrder[i]
}

for i in 0...studentOrder.count - 1 {
    
    var likeCount = 0
    
    for x in 0...n - 1 {
        for y in 0...n - 1 {
            if array[x][y] == studentOrder[i] {
                var nx = 0, ny = 0
                
                for j in dxdy {
                    nx = x + j.0
                    ny = y + j.1
                    
                    if (0...n - 1).contains(nx) && (0...n - 1).contains(ny) {
                        
                        if friendsArray[i].contains(array[nx][ny]) {
                            likeCount += 1
                        }
                    }
                }
            }
        }
    }
    result += Int(pow(Double(10), Double(likeCount - 1)))
}

print(result)
