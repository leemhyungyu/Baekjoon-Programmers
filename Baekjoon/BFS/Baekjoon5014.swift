//
//  Baekjoon5014.swift
//  Solved
//
//  Created by 임현규 on 2024/03/31.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let f = input[0], s = input[1], g = input[2], u = input[3], d = input[4]

func solution(_ f: Int, _ s: Int, _ g: Int, _ u: Int, _ d: Int) -> String {
    let stair = [u, -d]
    var visited = Array(repeating: false, count: f + 1)
    
    func bfs(_ start: Int) -> Int? {
        var queue = [(start, 0)]
        var result = 0
        visited[start] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let pos = now.0, count = now.1
            if pos == g { return count }
            
            for i in stair {
                let next = pos + i
                if !(1...f).contains(next) { continue }
                if visited[next]  { continue }
                queue.append((next, count + 1))
                visited[next] = true
            }
        }
        
        return nil
    }
    
    guard let result = bfs(s) else { return "use the stairs" }
    return String(result)
}

print(solution(f, s, g, u, d))
