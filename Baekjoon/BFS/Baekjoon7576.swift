//
//  Baekjoon7576.swift
//  
//
//  Created by 임현규 on 2024/03/19.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ m: Int, _ n: Int) -> Int {
    var array = array
    var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func bfs(_ queue: [(Int, Int)]) {
        var queue = queue
        var index = 0
        
        while index < queue.count {
            let x = queue[index].0, y = queue[index].1
            
            for xy in dxdy {
                let nx = x + xy.0, ny = y + xy.1
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }
                if array[nx][ny] == 0 {
                    array[nx][ny] = array[x][y] + 1
                    queue.append((nx, ny))
                }
            }
            
            index += 1

        }
    }
    
    var queue = [(Int, Int)]()
    for i in 0..<n {
        for j in 0..<m {
            if array[i][j] == 1 {
                queue.append((i, j))
            }
        }
    }
    
    bfs(queue)
    
    let result = array.flatMap { $0 }
    return result.contains(0) ? -1 : result.max()! - 1
}


print(solution(array, m, n))
