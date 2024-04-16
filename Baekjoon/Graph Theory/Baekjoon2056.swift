//
//  Baekjoon2056.swift
//  Solved
//
//  Created by 임현규 on 2024/04/17.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var time = Array(repeating: 0, count: n)
    var outNodeArray = Array(repeating: [Int](), count: n)
    var inNodeArray = Array(repeating: [Int](), count: n)
    var inDegree = Array(repeating: 0, count: n)
    var endTime = Array(repeating: 0, count: n)
    var queue = [Int]()
    
    for i in 0..<array.count {
        time[i] = array[i][0]
        inDegree[i] = array[i][1]
        inNodeArray[i] = Array(array[i][2..<array[i].count])
        array[i][2..<array[i].count].map { $0 - 1 }.forEach {
            outNodeArray[$0].append(i)
        }
    }
        
    for i in 0..<inDegree.count {
        if inDegree[i] == 0 { queue.append(i) }
    }
    
    for i in queue {
        endTime[i] = time[i]
    }

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let now = queue.removeFirst()
            for j in outNodeArray[now] {
                inDegree[j] -= 1
                if inDegree[j] == 0 {
                    queue.append(j)
                    endTime[j] = inNodeArray[j].map { endTime[$0 - 1] }.max()! + time[j]
                }
            }
        }
    }
        
    return endTime.max()!
}

print(solution(array, n))

