//
//  Baekjoon2529.swift
//  
//
//  Created by 임현규 on 2023/05/23.
//

import Foundation

let k = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { String($0) }
var resultArray = [String]()
var visited = Array(repeating: false, count: 10)

func solution(_ k: Int, _ array: [String]) {

    for i in 0...9 {
        dfs([i], i)
    }
    
    print(resultArray.max()!)
    print(resultArray.min()!)
}

func dfs(_ number: [Int], _ now: Int) {
    
    visited[now] = true
    
    if number.count == k + 1 {
        if check(number) {
            resultArray.append(number.map { String($0) }.joined())
        }
        
        return
    }
    
    for i in 0...9 {
     
        if visited[i] { continue }
        if !check(number) { continue }

        dfs(number + [i], i)
        visited[i] = false
    }
    
    visited[now] = false
}

func check(_ number: [Int]) -> Bool {
    
    var result = true
    
    for i in 0..<number.count - 1 {
        if array[i] == "<" {
            if number[i] < number[i + 1] {
                continue
            } else {
                result = false
            }
        } else {
            if number[i] > number[i + 1] {
                continue
            } else {
                result = false
            }
        }
    }
    
    return result
}


solution(k, array)
