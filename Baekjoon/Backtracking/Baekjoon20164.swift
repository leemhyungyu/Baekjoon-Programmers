//
//  Baekjoon20164.swift
//  Solved
//
//  Created by 임현규 on 2024/04/24.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> [Int] {
    var numbers = String(n).map { String($0) }
    var maxCount = numbers.filter { Int($0)! % 2 != 0 }.count
    var minCount = Int.max
    
    func backTraking(_ now: Int, _ oddCount: Int) {
        let nowNumbers = String(now).map { String($0) }
        maxCount = max(maxCount, oddCount)

        if nowNumbers.count >= 3 {
            for i in 0..<nowNumbers.count - 1 {
                for j in i + 1..<nowNumbers.count - 1 {
                    let newNumber = Int(nowNumbers[0...i].joined())! + Int(nowNumbers[i + 1...j].joined())! + Int(nowNumbers[j + 1..<nowNumbers.count].joined())!
                    backTraking(newNumber, oddCount + String(newNumber).map { Int(String($0))! }.filter { Int($0) % 2 != 0 }.count)
                }
            }
            
        } else if nowNumbers.count == 2 {
            let newNumber = nowNumbers.map { Int($0)! }.reduce(0) { $0 + $1 }
            backTraking(newNumber, oddCount + String(newNumber).map { Int(String($0))! }.filter { Int($0) % 2 != 0 }.count)
        } else if nowNumbers.count == 1 {
            maxCount = max(maxCount, oddCount)
            minCount = min(minCount, oddCount)
            return
        }
    }
    
    backTraking(n, maxCount)
    
    return [minCount, maxCount]
}

print(solution(n).map { String($0) }.joined(separator: " "))
