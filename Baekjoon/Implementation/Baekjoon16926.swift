//
//  Baekjoon16926.swift
//  
//
//  Created by 임현규 on 2022/12/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1], r = input[2]

var dxdy = [(1, 0), (0, 1), (-1, 0), (0, -1)] // 하, 우, 상, 좌
var array = [[Int]]()

for _ in 1...n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var group = [[Int]]()
var groupCount = min(n, m) / 2
var result = Array(repeating: Array(repeating: 0, count: m), count: n)

func decomposition() {
    
    for i in 0...groupCount - 1 {
                
        var numberArray = [Int]()
        var nowDirection = (1, 0)
        var queue = [(Int, Int)]()
        
        queue.append((i, i))
        numberArray.append(array[i][i])
        array[i][i] = 0
        
        while !queue.isEmpty {
            var nxny = queue.popLast()!
            var nx = nxny.0 + nowDirection.0
            var ny = nxny.1 + nowDirection.1
            
            if nx == i && ny == i {
                break
            }
            
            if (0...n - 1).contains(nx) && (0...m - 1).contains(ny) {
                if array[nx][ny] == 0 {
                    nowDirection = changeDirection(nowDirection)
                    nx = nxny.0 + nowDirection.0
                    ny = nxny.1 + nowDirection.1
                }
            } else {
                nowDirection = changeDirection(nowDirection)
                nx = nxny.0 + nowDirection.0
                ny = nxny.1 + nowDirection.1
            }
            
            numberArray.append(array[nx][ny])
            array[nx][ny] = 0
            queue.append((nx, ny))
        }
        
        group.append(numberArray.filter({ $0 != 0 }))
    }
}

func rotation() {
    for i in 0...group.count - 1 {
        group[i].insert(group[i].popLast()!, at: 0)
    }
}

func changeDirection(_ Direction: (Int, Int)) -> (Int, Int) {
    switch Direction {
    case (1, 0):
        return (0, 1)
    case (0, 1):
        return (-1, 0)
    case (-1, 0):
        return (0, -1)
    case (0, -1):
        return (0, 0)
    default:
        break
    }
    return (0, 0)
}

decomposition()

for i in 1...r {
    rotation()
}

for i in 0...groupCount - 1 {
            
    var nowDirection = (1, 0)
    var pos = (i, i)
    
    result[i][i] = group[i].removeFirst()
    
    while !group[i].isEmpty {

        var nx = pos.0 + nowDirection.0
        var ny = pos.1 + nowDirection.1
        
        if (0...n - 1).contains(nx) && (0...m - 1).contains(ny) {
            if result[nx][ny] != 0 {
                nowDirection = changeDirection(nowDirection)
                nx = pos.0 + nowDirection.0
                ny = pos.1 + nowDirection.1
                pos = (nx, ny)
                result[nx][ny] = group[i].removeFirst()
            } else {
                result[nx][ny] = group[i].removeFirst()
                pos = (nx, ny)
            }
        } else {
            nowDirection = changeDirection(nowDirection)
            nx = pos.0 + nowDirection.0
            ny = pos.1 + nowDirection.1
            pos = (nx, ny)
            result[nx][ny] = group[i].removeFirst()
        }
    }
}

result.forEach {
    print($0.map { String($0 )}.joined(separator: " "))
}
