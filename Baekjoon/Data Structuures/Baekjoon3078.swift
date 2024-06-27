//
//  Baekjoon3078.swift
//  Solved
//
//  Created by 임현규 on 6/27/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var array = [String]()

for _ in 0..<n {
    array.append(readLine()!)
}

func solution(_ array: [String], _ n: Int, _ k: Int) -> Int {
    var friendDic = [Int: Int]()
    var left = 0, right = 1
    var result = 0
    
    friendDic[array[left].count] = 1
    
    while right < n {
        result += (friendDic[array[right].count] ?? 0)
        
        if right >= k {
            friendDic[array[left].count] = (friendDic[array[left].count] ?? 0) - 1
            left += 1
        }
        friendDic[array[right].count] = (friendDic[array[right].count] ?? 0) + 1
        right += 1
    }
    
    return result
}

print(solution(array, n, k))
