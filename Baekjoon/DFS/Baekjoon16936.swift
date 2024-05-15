//
//  Baekjoon16936.swift
//  Solved
//
//  Created by 임현규 on 2024/05/15.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ array: [Int], _ n: Int) -> [Int] {
    var result = [Int]()
    
    func dfs(_ now: Int, _ route: [Int], _ count: Int) {
        
        if count == n {
            result = route
            return
        }
        
        if array.contains(now * 2) {
            dfs(now * 2, route + [now * 2], count + 1)
        }
        
        if now % 3 == 0 && array.contains(now / 3) {
            dfs(now / 3, route + [now / 3], count + 1)
        }
    }
    
    for i in array {
        dfs(i, [i], 1)
    }
    
    return result
}

print(solution(array, n).map { String($0) }.joined(separator: " "))
