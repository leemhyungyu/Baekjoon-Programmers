//
//  리코쳇 로봇.swift
//  
//
//  Created by 임현규 on 2023/04/12.
//

import Foundation

func solution(_ board:[String]) -> Int {
    
    var graph = [[String]]()
    let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌, 우
    var pos = (0, 0)
    let width = board.count
    let height = board.first!.count
    
    board.forEach {
        graph.append($0.map { String($0) })
    }
    
    for i in 0..<graph.count {
        for j in 0..<graph[i].count {
            if graph[i][j] == "R" {
                pos = (i, j)
                break
            }
        }
    }

    var visited = Array(repeating: Array(repeating: false, count: height), count: width)
    var queue = [(pos, 0)] // 위치, 이동한 거리
    var result = [Int]()
    
    while !queue.isEmpty {

        let element = queue.removeFirst()
        var pos = element.0, length = element.1
        visited[pos.0][pos.1] = true
        
        if graph[pos.0][pos.1] == "G" {
            result.append(length)
            break
        }
        
        for i in dxdy {
            var nx = pos.0 + i.0
            var ny = pos.1 + i.1
            
            while true {
                if !(0..<width).contains(nx) || !(0..<height).contains(ny) {
                    break
                }
                
                if graph[nx][ny] == "D" {
                    break
                }
    
                nx += i.0
                ny += i.1
            }
            
            nx -= i.0
            ny -= i.1
            
            if (0..<width).contains(nx) && (0..<height).contains(ny) {
                if visited[nx][ny] { continue }

                queue.append(((nx, ny), length + 1))
            }
        }
    }
    
    if result.isEmpty {
        return -1
    } else {
        return result.first!
    }
}
