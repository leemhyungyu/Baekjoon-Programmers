//
//  Baekjoon2660.swift
//  Solved
//
//  Created by 임현규 on 2024/04/07.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

func solution(_ array: [[Int]], _ n: Int) {
    var friend = Array(repeating: [Int](), count: n + 1)
    var scoreArray = Array(repeating: 0, count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var minScore = n
    for i in array {
        friend[i[0]] += [i[1]]
        friend[i[1]] += [i[0]]
    }
    
    func bfs(_ start: Int) -> Int {
        var count = 0
        var queue = [(start, 0)]
        
        visited[start] = true
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let target = now.0, depth = now.1
            for next in friend[target] {
                if visited[next] { continue }
                queue.append((next, depth + 1))
                count = depth + 1
                visited[next] = true
            }
        }
        
        return count
    }

    for i in 1...n {
        visited = Array(repeating: false, count: n + 1)
        let score = bfs(i)
        minScore = min(score, minScore)
        scoreArray[i] = score
    }
    
    print(minScore, scoreArray.filter { $0 == minScore }.count)
    print(scoreArray.enumerated().filter { $0.element == minScore }.map { String($0.offset) }.joined(separator: " "))
}

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == -1 && input[1] == -1 { break }
    array.append(input)
}

solution(array, n)

