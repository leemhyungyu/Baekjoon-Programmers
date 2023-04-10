//
//  삼각 달팽이.swift
//  
//
//  Created by 임현규 on 2023/04/10.
//

import Foundation

var number = 0

func solution(_ n:Int) -> [Int] {
    var n = n
    var array = Array(repeating: Array(repeating: 0, count: n), count: n)
    var dxdy = [(-1, -1), (1, 0), (0, 1)] // 좌상, 하, 우
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)

    for i in 0..<n {
        number += 1
        array[i][0] = number
        visited[i][0] = true
    }
    
    for i in 1..<n {
        number += 1
        array[n - 1][i] = number
        visited[n - 1][i] = true
    }

    func dfs(_ pos: (Int, Int), _ direction: (Int, Int)) {
        
        if visited[pos.0][pos.1] {
           return
        }
        
        number += 1
        visited[pos.0][pos.1] = true
        array[pos.0][pos.1] = number
        
        if (0..<n).contains(pos.0 + direction.0) && (0..<n).contains(pos.1 + direction.1) {
            if !visited[pos.0 + direction.0][pos.1 + direction.1] {
                // 갈수 있음
                dfs((pos.0 + direction.0, pos.1 + direction.1), direction)
            } else {
                // 못감
                let newDirection = changeDirection(direction)
                dfs((pos.0 + newDirection.0, pos.1 + newDirection.1), changeDirection(direction))
            }
        } else {
            let newDirection = changeDirection(direction)
            dfs((pos.0 + newDirection.0, pos.1 + newDirection.1), changeDirection(direction))
            // 못감
        }
    }
    
    if n == 1 {
        return [1]
    }
    
    dfs((n - 2, n - 2), (-1, -1))

    var result = [[Int]]()
    
    for i in 0..<n {
        result.append(array[i][0...i].map { Int($0) })
    }
    
    return result.reduce([]) { $0 + $1}
}

func changeDirection(_ direction: (Int, Int)) -> (Int, Int) {
    switch direction {
        case (-1, -1):
            return (1, 0)
        case (1, 0):
            return (0, 1)
        case (0, 1):
            return (-1, -1)
        default:
            return (0, 0)
    }
}
