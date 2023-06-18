//
//  Baekjoon18428.swift
//  
//
//  Created by 임현규 on 2023/06/18.
//

import Foundation

var n = Int(readLine()!)!
var array = [[String]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { String($0) })
}

func solution(_ array: [[String]]) -> Bool {
    var result = false
    var xPos = [(Int, Int)]()
    var array = array
    
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
  
    for i in 0..<n {
        for j in 0..<n {
            if array[i][j] == "X" {
                xPos.append((i, j))
            }
        }
    }
    
  
    func dfs(_ pos: [(Int, Int)]) {
                
        if pos.count == 3 {
            
            if checkStudent(array) {
                result = true
            }
            
            return
        }
        
        for i in xPos {
            if visited[i.0][i.1] { continue }
            
            visited[i.0][i.1] = true
            array[i.0][i.1] = "O"
            dfs(pos + [i])
            visited[i.0][i.1] = false
            array[i.0][i.1] = "X"
        }
    }
    
    for i in xPos {
        visited[i.0][i.1] = true
        array[i.0][i.1] = "O"
        dfs([i])
        visited[i.0][i.1] = false
        array[i.0][i.1] = "Y"
    }
    
    return result
}

func checkStudent(_ array: [[String]]) -> Bool {
    
    var flag = true
    
    for i in 0..<n {
        for j in 0..<n {
            
            if array[i][j] != "T" { continue }
            
            // 상
            for x in (0..<i).reversed() {
                if array[x][j] == "O" {
                    break
                }  else if array[x][j] == "S" {
                    flag = false
                }
            }
            
            // 하
            for x in (i..<n) {
                if array[x][j] == "O" { break }
                else if array[x][j] == "S" { flag = false }
            }
            
            // 좌
            
            for y in (0..<j).reversed() {
                if array[i][y] == "O" { break }
                else if array[i][y] == "S" { flag = false }
            }
            
            // 우

            for y in (j..<n) {
                if array[i][y] == "O" { break }
                else if array[i][y] == "S" { flag = false }
            }
        }
    }
    
    return flag
}

print(solution(array) ? "YES" : "NO" )
