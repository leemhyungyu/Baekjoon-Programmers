//
//  Baekjoon1992.swift
//  Solved
//
//  Created by 임현규 on 2024/03/30.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
var dxdy = [(0, 0), (0, 1), (1, 0), (1, 1)]

for _ in 0..<n {
    array.append(readLine()!.map { Int(String($0))! })
}

func solution(_ array: [[Int]], _ n: Int) -> String {
    var array = array
    var result = [String]()
    var size = n
    
    search(n, (0, 0), &array, &result)
    return result.joined(separator: "")
}

func search(_ size: Int, _ start: (Int, Int), _ array: inout [[Int]], _ result: inout [String]) {
        
    if let number = check(array, start, size) {
        result.append("\(number)")
        return
    }
    
    result.append("(")
    
    for i in dxdy {
        let nx = start.0 + i.0 * size / 2, ny = start.1 + i.1 * size / 2
        search(size / 2, (nx, ny), &array, &result)
    }
    
    result.append(")")
}

func check(_ array: [[Int]], _ start: (Int, Int), _ size: Int) -> Int? {
    var result = array[start.0][start.1]
    
    for i in start.0..<start.0 + size {
        for j in start.1..<start.1 + size {
            if array[i][j] == result { continue }
            return nil
        }
    }
    
    return result
}

print(solution(array, n))
