//
//  Baekjoon1759.swift
//  
//
//  Created by 임현규 on 2023/06/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let l = input[0], c = input[1]
var gather = ["a", "e", "i", "o", "u"]
var wordSet = Set<String>()
var visited = Array(repeating: false, count: c)
var word = readLine()!.split(separator: " ").map { String($0) }


func solution(_ word: [String]) {
    
    for i in 0..<c {
        visited[i] = true
        dfs([word[i]], i, gather.contains(word[i]) ? 1 : 0)
        visited[i] = false
    }
    
    wordSet.sorted { $0 < $1 }.forEach { print($0) }
}

func dfs(_ words: [String], _ index: Int, _ count: Int) {
        
    if words.count == l {
        // 모음, 자음 조건
        if count > 0 && l - count > 1 {
            wordSet.insert(words.sorted { $0 < $1 }.joined())
            return
        }
        
        return
    }
    
    for i in index + 1..<c {
    
        if visited[i] { continue }
        
        let newCount = gather.contains(word[i]) ? count + 1 : count
        visited[i] = true
        dfs(words + [word[i]], i, newCount)
        visited[i] = false
    }
}
