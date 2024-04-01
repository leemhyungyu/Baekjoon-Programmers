//
//  Baekjoon9205.swift
//  Solved
//
//  Created by 임현규 on 2024/04/01.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ house: (Int, Int), _ store: [(Int, Int)], _ fastival: (Int, Int), _ n: Int) -> String {
    func bfs(_ start: (Int, Int)) -> Bool {
        var queue = [start]
        var visited = Set<Int>()
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos.0, y = pos.1
            
            if abs(x - fastival.0) + abs(y - fastival.1) <= 1000 {
                return true
            }
            
            for i in 0..<store.count {
                let nx = store[i].0, ny = store[i].1
                if visited.contains(i) { continue }
                if abs(x - nx) + abs(y - ny) <= 1000 {
                    queue.append((nx, ny))
                    visited.insert(i)
                }
            }
        }
        
        return false
    }
    
    return bfs(house) ? "happy" : "sad"
}

for _ in 0..<t {
    var house = (0, 0)
    var store = [(Int, Int)]()
    var fastival = (0, 0)
    
    let n = Int(readLine()!)!
    for i in 0..<n + 2 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        if i == 0 {
            house = (input[0], input[1])
        } else if i == n + 1 {
            fastival = (input[0], input[1])
        } else {
            store.append((input[0], input[1]))
        }
    }
    
    print(solution(house, store, fastival, n))
}
