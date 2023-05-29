//
//  Baekjoon14620.swift
//  
//
//  Created by 임현규 on 2023/05/30.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = [Int]()
var dxdy = [(0, 0), (-1, 0), (1, 0), (0, -1), (0, 1)]

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]]) -> Int {
    
    for i in 1..<n - 1 {
        for j in 1..<n - 1 {
            visited = Array(repeating: Array(repeating: false, count: n), count: n)
            setFlower([(i, j)], culFlower(i, j))
        }
    }
    
    return result.min()!
}

func setFlower(_ pos: [(Int, Int)], _ value: Int) {
       
    let nx = pos.last!.0
    let ny = pos.last!.1
    
    setVisited(nx, ny, true)
    
    if pos.count == 3 {
        result.append(value)
        return
    }
    
    for i in 1..<n - 1 {
        for j in 1..<n - 1 {
                        
            if checkVisited(i, j) {
                setFlower(pos + [(i, j)], value + culFlower(i, j))
                setVisited(i, j, false)
            }
        }
    }
    
    setVisited(nx, ny, false)
}

func setVisited(_ x: Int, _ y: Int, _ isVisited: Bool) {
     
    for i in dxdy {
        visited[i.0 + x][i.1 + y] = isVisited
    }
}
func checkVisited(_ x: Int, _ y: Int) -> Bool {
    
    for i in dxdy {
        if visited[x + i.0][y + i.1] { return false }
    }
    return true
}

func culFlower(_ x: Int, _ y: Int) -> Int {
    return array[x][y] + array[x - 1][y] + array[x + 1][y] + array[x][y - 1] + array[x][y + 1]
}

print(solution(array))
