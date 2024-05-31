//
//  Baekjoon17141.swift
//  Solved
//
//  Created by 임현규 on 5/31/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var virusArray = [(Int, Int)]()
    var array = array
    var tempArray = array
    var result = Int.max
    var isFlag = false
    
    for i in 0..<n {
        for j in 0..<n {
            if array[i][j] == 2 {
                virusArray.append((i, j))
                array[i][j] = 0
            }
            
            if array[i][j] == 1 {
                array[i][j] = -1
            }
        }
    }
    
    func makeCombi(_ now: Int, _ combi: [Int]) {
        if combi.count == m {
            tempArray = array

            visited = Array(repeating: Array(repeating: false, count: n), count: n)
            
            for i in combi {
                bfs(virusArray[i])
            }
            
            if tempArray.flatMap { $0 }.filter { $0 == 0 }.count == m {
                result = min(result, tempArray.flatMap { $0 }.max()!)
                isFlag = true
                return
            }
        }
        
        for i in now..<virusArray.count {
            if combi.contains(i) { continue }
            makeCombi(i, combi + [i])
        }
    }
    
    
    func bfs(_ start: (Int, Int)) {
        visited[start.0][start.1] = true
        tempArray[start.0][start.1] = 0
        var queue = [start]
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let x = now.0, y = now.1
            
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                if !(0..<n).contains(nx) || !(0..<n).contains(ny){ continue }
                if tempArray[nx][ny] == -1 { continue }
                if visited[nx][ny] {
                    if tempArray[nx][ny] > tempArray[x][y] + 1 {
                        tempArray[nx][ny] = tempArray[x][y] + 1
                        queue.append((nx, ny))
                    }
                }
                
                if !visited[nx][ny] {
                    if tempArray[nx][ny] == 0 || tempArray[nx][ny] == 2 {
                        tempArray[nx][ny] = tempArray[x][y] + 1
                        queue.append((nx, ny))
                        visited[nx][ny] = true
                    }
                }
            }
        }
    }
    
    makeCombi(0, [])

    return isFlag ? result : -1
}

print(solution(array, n, m))
