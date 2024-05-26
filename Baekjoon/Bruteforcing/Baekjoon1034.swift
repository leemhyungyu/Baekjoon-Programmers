//
//  Baekjoon1034.swift
//  Solved
//
//  Created by 임현규 on 5/26/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.map { Int(String($0))! })
}

let k = Int(readLine()!)!

func solution(_ array: [[Int]], _ n: Int, _ m: Int, _ k: Int) -> Int {
    var result = 0
    
    for i in 0..<n {
        let numberOfZero = array[i].filter { $0 == 0 }.count
        var numberOfTurnOn = 0
        
        if numberOfZero <= k && numberOfZero % 2 == k % 2 {
            for j in 0..<n {
                if array[i] == array[j] { numberOfTurnOn += 1 }
            }
        }
        
        result = max(result, numberOfTurnOn)
    }
    
    return result
}

print(solution(array, n, m, k))
