//
//  Baekjoon1327.swift
//  Solved
//
//  Created by 임현규 on 7/16/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int, _ k: Int) -> Int {
    let sortedArray = array.sorted()
    var visited = Set<[Int]>()
    
    func bfs(_ array: [Int]) -> Int {
        var queue = [(array, 0)]
        visited.insert(array)
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let nowArray = now.0, nowCount = now.1
            if nowArray == sortedArray {
                return nowCount
            }
            
            for i in 0...n - k {
                let newArray: [Int] = nowArray[0..<i] + Array(nowArray[i..<i + k].reversed()) + nowArray[i + k..<n]
                if visited.contains(newArray) { continue }
                queue.append((newArray, nowCount + 1))
                visited.insert(newArray)
            }
        }
        return -1
    }
    
    return bfs(array)
}

print(solution(array, n, k))
