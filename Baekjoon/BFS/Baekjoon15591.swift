//
//  Baekjoon15591.swift
//  Solved
//
//  Created by 임현규 on 2024/04/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], q = input[1]
var usado = [[Int]]()
var question = [[Int]]()

for _ in 0..<n - 1 {
    usado.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for _ in 0..<q {
    question.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ usado: [[Int]], _ question: [[Int]], _ n: Int, _ q: Int) -> [Int] {
    var array = Array(repeating: [(Int, Int)](), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var result = [Int]()
    
    for i in usado {
        array[i[0]] += [(i[1], i[2])]
        array[i[1]] += [(i[0], i[2])]
    }
    
    for i in question {
        let k = i[0], v = i[1]
        visited = Array(repeating: false, count: n + 1)
        result.append(bfs(v, Int.max, k) - 1)
    }
      
    func bfs(_ start: Int, _ usado: Int, _ k: Int) -> Int {
        var queue = [(start, usado)]
        var index = 0
        visited[start] = true
        var count = 0
        while index < queue.count {
            let temp = queue[index]
            let now = temp.0, nowUsdao = temp.1
            if nowUsdao >= k { count += 1}
            for i in array[now] {
                if visited[i.0] { continue }
                queue.append((i.0, min(nowUsdao, i.1)))
                visited[i.0] = true
            }
            
            index += 1
        }
        return count
    }
    
    return result
}

solution(usado, question, n, q).forEach { print($0) }

