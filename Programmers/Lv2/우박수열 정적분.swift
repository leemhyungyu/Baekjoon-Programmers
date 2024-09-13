//
//  우박수열 정적분.swift
//  Solved
//
//  Created by 임현규 on 9/13/24.
//

import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    let sequence = collatz(k)
    let n = sequence.count - 1
    let area = calculateArea(n, sequence)
    var answer = [Double]()
    
    for i in ranges {
        let a = i[0], b = n + i[1]
        answer.append(calculateIntegral(a, b, area))
    }
    
    return answer
}

func collatz(_ k: Int) -> [Int] {
    var sequence = [k]
    var k = k
    
    while k > 1 {
        if k % 2 == 0 {
            k /= 2
        } else {
            k = k * 3 + 1
        }
        
        sequence.append(k)
    }
    
    return sequence
}

func calculateArea(_ n: Int, _ sequence: [Int]) -> [Double] {
    var area: [Double] = Array(repeating: 0.0, count: n + 1)
    for i in 1...n {
        area[i] = area[i - 1] + (Double(sequence[i - 1]) + Double(sequence[i])) / 2
    }
    return area
}

func calculateIntegral(_ a: Int, _ b: Int, _ area: [Double]) -> Double {
    if a > b { return -1.0 }
    return area[b] - area[a]
}
