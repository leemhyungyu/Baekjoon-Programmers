//
//  Baekjoon1027.swift
//  Solved
//
//  Created by 임현규 on 5/23/24.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ n: Int, _ array: [Int]) -> Int {
    var result = 0
    
    
    for targetBuliding in 0..<n {
        var count = 0
        let x1 = targetBuliding, y1 = array[targetBuliding]
        var currentGradient: Double? = nil
        
        for i in (0..<targetBuliding).reversed() {
            let x2 = i, y2 = array[i]
            let gradient = Double(y1 - y2) / Double(x1 - x2)
            if currentGradient == nil || currentGradient! > gradient {
                currentGradient = gradient
                count += 1
            }
        }
        
        currentGradient = nil
        
        for j in targetBuliding + 1..<n {
            let x2 = j, y2 = array[j]
            let gradient = Double(y1 - y2) / Double(x1 - x2)
            if currentGradient == nil || currentGradient! < gradient {
                currentGradient = gradient
                count += 1
            }
        }
        
        result = max(result, count)
    }
    return result
}

print(solution(n, array))
