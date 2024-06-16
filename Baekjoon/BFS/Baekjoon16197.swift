//
//  Baekjoon16197.swift
//  Solved
//
//  Created by 임현규 on 6/16/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[String]]()

for _ in 0..<n {
    array.append(readLine()!.map { String($0) })
}

func solution(_ array: [[String]], _ n: Int, _ m: Int) -> Int {
    let dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var result = 0
    
    func bfs(_ one: (Int, Int), _ two: (Int, Int)) -> Int {
        var queue = [(one.0, one.1, two.0, two.1, 0)]
        var index = 0
        while index < queue.count {
            let now = queue[index]
            let oneX = now.0, oneY = now.1
            let twoX = now.2, twoY = now.3
                    
            if now.4 >= 10 {
                return -1
            }
            
            for i in dxdy {
                var newOneX = oneX + i.0, newOneY = oneY + i.1
                var newTwoX = twoX + i.0, newTwoY = twoY + i.1
                
                if !checkOut(newOneX, newOneY) && !checkOut(newTwoX, newTwoY) {
                    
                    if array[newOneX][newOneY] == "#" {
                        newOneX = oneX
                        newOneY = oneY
                    }
                    
                    if array[newTwoX][newTwoY] == "#" {
                        newTwoX = twoX
                        newTwoY = twoY
                    }
                    
                    queue.append((newOneX, newOneY, newTwoX, newTwoY, now.4 + 1))
                }
                
                if checkOut(newOneX, newOneY) && checkOut(newTwoX, newTwoY) { continue }
                
                if checkOut(newOneX, newOneY) || checkOut(newTwoX, newTwoY) { return now.4 + 1 }
            }
            
            index += 1
        }
        
        return -1
    }
    
    func checkOut(_ x: Int, _ y: Int) -> Bool {
        return !(0..<n).contains(x) || !(0..<m).contains(y) ? true : false
    }
    
    var coinPos = [(Int, Int)]()
    for i in 0..<n {
        for j in 0..<m {
            if array[i][j] == "o" {
                coinPos.append((i, j))
            }
        }
    }
    
    result = bfs(coinPos[0], coinPos[1])
    
    return result
}

print(solution(array, n, m))
