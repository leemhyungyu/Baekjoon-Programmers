//
//  단어 변환.swift
//  
//
//  Created by 임현규 on 2023/04/12.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {

    if !words.contains(target) { return 0 }
        
    var beginWords = begin.map { String($0) }
    var targetWords = target.map { String($0) }
        
    var visited = Array(repeating: false, count: words.count) // 각 단어를 방문했는지 체크
    
    var queue: [[String]] = [beginWords]
    var count = 0
    var resultCount = 0
    while !queue.isEmpty {
        
        let element = queue.removeFirst().map { String($0) }
        
        if element == targetWords { break }
        
        resultCount = 0
        for i in 0..<element.count {
            if element[i] != targetWords[i] {
                resultCount += 1
            }
        }
        
        if resultCount == 1 {
            count += 1
            break
        }
        
        for i in 0..<words.count {
            let word = words[i].map { String($0) }

            var difCount = 0
            
            if visited[i] { continue }
            
            for j in 0..<word.count {
                if String(word[j]) != String(element[j]) {
                    difCount += 1
                }
            }
            
            if difCount == 1 {
                visited[i] = true
                queue.append(word)
                count += 1
                break
            }
        }
    }

    return count
}
