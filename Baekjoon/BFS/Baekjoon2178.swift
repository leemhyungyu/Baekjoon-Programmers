//
//  Baekjoon2178.swift
//  
//
//  Created by 임현규 on 2024/03/19.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    let input = readLine()!
    array.append(input.map { Int(String($0))! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var array = array
    var result = 0
    var dxdy = [(-1, 0), (1, 0), (0, 1), (0, -1)]

    func bfs(_ start: (Int, Int)) {
        var queue = [start]
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            for i in dxdy {
                let nx = x + i.0, ny = y + i.1
                
                if !(0..<n).contains(nx) || !(0..<m).contains(ny) { continue }

                if array[nx][ny] == 1 {
                    array[nx][ny] = array[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    bfs((0, 0))
    
    return array[n - 1][m - 1]
}

print(solution(array, n, m))
