//
//  Baekjoon9466.swift
//  
//
//  Created by 임현규 on 2024/03/18.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    print(solution(numbers, n))
}
func solution(_ numbers: [Int], _ n: Int) -> Int {
    var result = 0
    var visited = Array(repeating: false, count: n + 1)
    var finished = Array(repeating: false, count: n + 1)

    func dfs(_ start: Int) {
        visited[start] = true
        var n = numbers[start - 1]
        
        if !visited[n] {
            dfs(n)
        } else if !finished[n] {
            while n != start {
                result += 1
                n = numbers[n - 1]
            }
            result += 1
        }
        
        finished[start] = true
    }
    
    for i in 1...n {
        if visited[i] { continue }
        dfs(i)
    }
    
    return n - result
}
