//
//  Baekjoon17265.swift
//  Solved
//
//  Created by 임현규 on 2024/05/13.
//

import Foundation

let n = Int(readLine()!)!
var array = [[String]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { String($0) })
}

func solution(_ array: [[String]], _ n: Int) -> [Int] {
    let dxdy = [(1, 0), (0, 1)]
    var maxValue = -Int.max, minValue = Int.max
    var result = [Int]()
    
    func dfs(_ now: (Int, Int), _ route: [String]) {
        
        if now == (n - 1, n - 1) {
            let value = calculate(route: route)
            maxValue = max(maxValue, value)
            minValue = min(minValue, value)
            return
        }
        
        for i in dxdy {
            let nx = i.0 + now.0, ny = i.1 + now.1
            if !(0..<n).contains(nx) || !(0..<n).contains(ny) { continue }
            dfs((nx, ny), route + [array[nx][ny]])
        }
    }
    
    func calculate(route: [String]) -> Int {
        var result = Int(route.first!)!

        for i in 1..<route.count {
            switch route[i] {
            case "+":
                result = result + Int(route[i + 1])!
            case "-":
                result = result - Int(route[i + 1])!
            case "*":
                result = result * Int(route[i + 1])!
            default:
                continue
            }
        }
        
        return result
    }
    
    dfs((0, 0), [array[0][0]])
    
    return [maxValue, minValue]
}

print(solution(array, n).map { String($0) }.joined(separator: " "))
