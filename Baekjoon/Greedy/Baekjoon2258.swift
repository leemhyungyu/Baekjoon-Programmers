//
//  Baekjoon2258.swift
//  Solved
//
//  Created by 임현규 on 6/20/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ m: Int) -> Int {
    let array = array.sorted { $0[1] == $1[1] ? $0[0] > $1[0] : $0[1] < $1[1] }
    var nowWeight = 0, nowCost = 0, maxCost = 0
    
    for i in 0..<n {
        if nowWeight < m {
            nowWeight += array[i][0]
            
            if maxCost < array[i][1] {
                maxCost = array[i][1]
                nowCost = array[i][1]
            } else if maxCost == array[i][1] {
                nowCost += array[i][1]
            }

        } else {
            if maxCost < array[i][1] && nowCost > array[i][1] {
                nowCost = array[i][1]
                break
            }
        }
    }
    
    return nowWeight < m ? -1 : nowCost
}

print(solution(array, n, m))
