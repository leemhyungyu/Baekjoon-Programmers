//
//  Baekjoon16397.swift
//  Solved
//
//  Created by 임현규 on 6/17/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], t = input[1], g = input[2]

func solution(_ n: Int, _ t: Int, _ g: Int) -> String {
    var visited = Array(repeating: false, count: 100000)
    func bfs(_ start: Int) -> String {
        var queue = [(start, 0)]
        visited[start] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let number = now.0, count = now.1
            if count > t { continue }
            if number == g { return String(count) }
            for i in 0..<2 {
                var nextNumber = number
                if i == 0 && number + 1 <= 99999 {
                    nextNumber += 1
                } else if number * 2 <= 99999 {
                    nextNumber *= 2
        
                    var numberArray = String(nextNumber).map { Int(String($0))! }

                    for i in 0..<numberArray.count {
                        if numberArray[i] != 0 {
                            numberArray[i] -= 1
                            break
                        }
                    }
                    
                    nextNumber = Int(numberArray.map { String($0) }.joined())!
                }
                
                if visited[nextNumber] { continue }
                visited[nextNumber] = true
                queue.append((nextNumber, count + 1))
            }
            
        }
        
        return "ANG"
    }
    
    
    return bfs(n)
}

print(solution(n, t, g))
