//
//  Baekjoon1780.swift
//  Solved
//
//  Created by 임현규 on 2024/03/26.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ n: Int, _ array: [[Int]]) {
    var minusCount = 0
    var zeroCount = 0
    var oneCount = 0
    var papers = [(0, 0, n)]
    
    while !papers.isEmpty {
        let paper = papers.removeLast()
        let start = (paper.0, paper.1)
        let size = paper.2
        
        guard let number = check(start, size, array) else {
            for x in 0..<3 {
                for y in 0..<3 {
                    papers.append((start.0 + x * (size / 3), start.1 + y * (size / 3), size / 3))
                }
            }
            
            continue
        }
        
        switch number {
        case 0:
            zeroCount += 1
        case 1:
            oneCount += 1
        case -1:
            minusCount += 1
        default: continue
        }
    }
    
    print(minusCount)
    print(zeroCount)
    print(oneCount)
}

func check(_ start: (Int, Int), _ size: Int, _ array: [[Int]]) -> Int? {
    let targetNumber = array[start.0][start.1]

    for x in (start.0..<start.0 + size) {
        for y in (start.1..<start.1 + size) {
            if array[x][y] != targetNumber {
                return nil
            }
        }
    }
    
    return targetNumber
}

solution(n, array)
