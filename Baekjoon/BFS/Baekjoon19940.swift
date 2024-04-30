//
//  Baekjoon19940.swift
//  Solved
//
//  Created by 임현규 on 2024/04/30.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ n: Int) -> [Int] {
    var result = [Int]()
    let button = [-1, 1, -10, 10, 60]
    var visited = Set<Int>()
    
    func bfs(_ min: Int) {
        var queue = [(0, [0, 0, 0, 0, 0])]
        
        if min >= 60 {
            queue = [(0, [0, 0, 0, 0, min / 60])]
        }
        
        visited.insert(0)
        
        while !queue.isEmpty {
            
            let now = queue.removeFirst()
            let nowMin = now.0, nowButton = now.1
            
            if nowMin == n % 60 {
                result = nowButton.reversed()
                break
            }
            
            for i in 0..<button.count {
                let next = nowMin + button[i]
                if next < 0 || next > 60 { continue }
                if visited.contains(next) { continue }
                var nextButton = nowButton
                nextButton[i] += 1
                queue.append((next, nextButton))
                visited.insert(next)
            }
        }
    }
    
    bfs(n)
    return result
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(solution(n).map { String($0) }.joined(separator: " "))
}
