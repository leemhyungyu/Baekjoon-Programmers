//
//  Baekjoon12869.swift
//  Solved
//
//  Created by 임현규 on 6/20/24.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> Int {
    
    let attack = [[1, 3, 9], [1, 9, 3], [3, 1, 9], [3, 9, 1], [9, 3, 1], [9, 1, 3]]
    var visited = Set<[Int]>()
    
    func bfs(_ hp: [Int]) -> Int {
        var queue = [([Int], Int)]()
        visited.insert(hp)
        queue = [(hp, 0)]
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let hp = now.0, count = now.1
                
            if hp.filter { $0 > 0 }.isEmpty { return count }
            
            for i in attack {
                let newHp = hp.enumerated().map { $0.element - i[$0.offset] }
                if visited.contains(newHp) { continue }
                visited.insert(newHp)
                queue.append((newHp, count + 1))
            }
        }
        
        return 0
    }
    
    return bfs(array)
}

print(solution(array, n))
