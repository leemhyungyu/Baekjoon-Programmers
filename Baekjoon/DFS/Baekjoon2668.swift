//
//  Baekjoon2668.swift
//  Solved
//
//  Created by 임현규 on 2024/04/06.
//

import Foundation

let n = Int(readLine()!)!
var array = [Int]()
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int) {
    var array = [0] + array
    var graph = Array(repeating: [Int](), count:  n + 1)
    
    for i in 1...n {
        graph[i] += [array[i]]
    }
    
    var visited = Array(repeating: false, count: n + 1)
    
    var value = 0
    var resultSet = Set<Int>()
    
    func dfs(_ start: Int, _ end: Int, _ now: Int, _ route: [Int]) {
        visited[now] = true
        
        if start == end {
            resultSet.insert(start)
            return
        }
        
        if start == now {
            for i in route {
                resultSet.insert(i)
            }
            
            return
        }
        
        for i in graph[now] {
            if route.contains(i) { continue }
            dfs(start, end, i, route + [i])
        }
    }
    
    for i in 1...n {
        
        dfs(i, array[i], array[i], [array[i]])
    }

    var result = Array(resultSet).sorted()
    print(result.count)
    result.forEach { print($0) }
}

solution(array, n)
