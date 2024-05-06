//
//  Baekjoon2458.swift
//  Solved
//
//  Created by 임현규 on 2024/05/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    var result = 0
    var outGraph = Array(repeating: [Int](), count: n + 1)
    var inGraph = Array(repeating: [Int](), count: n + 1)
    
    for i in array {
        outGraph[i[0]] += [i[1]]
        inGraph[i[1]] += [i[0]]
    }
    
    func countOfbigger(_ start: Int) -> Int {
        var visited = Array(repeating: false, count: n + 1)
        var queue = [start]
        visited[start] = true
        var count = 0
        while !queue.isEmpty {
            let now = queue.removeFirst()
            
            for next in outGraph[now] {
                if visited[next] { continue }
                count += 1
                queue.append(next)
                visited[next] = true
            }
        }
        
        return count
    }
    
    func countOfSmaller(_ start: Int) -> Int {
        var visited = Array(repeating: false, count: n + 1)
        var queue = [start]
        var count = 0
        while !queue.isEmpty {
            let now = queue.removeFirst()
            
            for next in inGraph[now] {
                if visited[next] { continue }
                count += 1
                queue.append(next)
                visited[next] = true
                
            }
        }
        
        return count
    }
    
    for i in 1...n {
        let biggerCount = countOfbigger(i)
        let smallCount = countOfSmaller(i)
        
        if biggerCount + smallCount == n - 1 {
            result += 1
        }
    }
    return result
}

print(solution(array, n, m))
