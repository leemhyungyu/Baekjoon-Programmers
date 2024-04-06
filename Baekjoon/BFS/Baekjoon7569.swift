//
//  Baekjoon7569.swift
//  Solved
//
//  Created by 임현규 on 2024/04/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], h = input[2]
var array = Array(repeating: [[Int]](), count: h)
var queue = [(Int, Int, Int)]()

for i in 0..<h {
    for _ in 0..<m {
        array[i].append(readLine()!.split(separator: " ").map { Int($0)! })
    }
}

func solution(_ array: [[[Int]]], _ n: Int, _ m: Int, _ h: Int) -> Int {
    var array = array
    var result = 0
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: n), count: m), count: h)
    
    let dxdy = [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]
    var count = 0
    func bfs() {
        var index = 0
        
        while index < queue.count {
            let now = queue[index]
            index += 1
            count += 1
            
            let x = now.0, y = now.1, z = now.2
            
            for i in dxdy {
                count += 1
                let nx = x + i.0, ny = y + i.1, nz = z + i.2

                if !(0..<m).contains(nx) || !(0..<n).contains(ny) || !(0..<h).contains(nz) { continue }


                if visited[nz][nx][ny] { continue }

                if array[z][x][y] >= 1 && array[nz][nx][ny] == 0 {

                    array[nz][nx][ny] = array[z][x][y] + 1
                    queue.append((nx, ny, nz))
                }
                
                visited[nz][nx][ny] = true
            }
        }
    }
    
    for x in 0..<m {
        for y in 0..<n {
            for h in 0..<h {
                if array[h][x][y] == 1 {
                    queue.append((x, y, h))
                }
            }
        }
    }
    
    bfs()
    
    for x in 0..<m {
        for y in 0..<n {
            for h in 0..<h {
                if array[h][x][y] >= 1 {
                    result = max(result, array[h][x][y])
                } else if array[h][x][y] == 0 {
                    return -1
                }
            }
        }
    }
    
    return result - 1
}

print(solution(array, n, m, h))
