//
//  후보키.swift
//  
//
//  Created by 임현규 on 2023/06/09.
//

import Foundation

var result = 0
var visited = [Bool]()

func solution(_ relation:[[String]]) -> Int {

    var visited = Array(repeating: false, count: relation.first!.count)
    
    func dfs(_ key: [Int], _ index: Int, _ relation: [[String]]) {
        
        
        if checkUnique(key, relation) {
            
            if key.count > 1 {
                var flag = false
                for i in key {
                    
                    // 유일성이 안깨지는게 하나라도 있는 경우
                    if checkUnique(key.filter { $0 != i }.map { Int($0) }, relation) {
                        flag = true
                    }
                }
                
                if !flag { result += 1 }
            } else {
                result += 1
            }
            
            return
        }

        if key.count == relation.first!.count {
            return
        }

        for i in index + 1..<relation.first!.count {
            if visited[i] { continue }
            
            visited[i] = true
            dfs(key + [i], i, relation)
            visited[i] = false
        }
    }
    
    for i in 0..<relation.first!.count {
        
        visited[i] = true
        dfs([i], i, relation)
        visited[i] = false
    }

    return result
}

// 유일성을 판단하는 함수
func checkUnique(_ key: [Int], _ relation: [[String]]) -> Bool {
    
    var attitudeSet = Set<String>()

    for i in 0..<relation.count {
        var temp = ""
        
        for j in key {
            temp += relation[i][j]
        }
        
        attitudeSet.insert(temp)
    }
    
    return attitudeSet.count == relation.count ? true : false
}
