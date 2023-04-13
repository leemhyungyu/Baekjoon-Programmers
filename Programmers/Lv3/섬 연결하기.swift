//
//  섬 연결하기.swift
//  
//
//  Created by 임현규 on 2023/04/14.
//

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {

    var parent = (0..<n).map { $0 }
    
    func findParent(_ node: Int) -> Int {
        if parent[node] == node {
            return node
        } else {
            return findParent(parent[node])
        }
    }
    
    func union(_ a: Int, _ b: Int) {
        let a = findParent(a)
        let b = findParent(b)
        
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    var result = 0
    
    for i in costs {
        let (start, end, cost) = (i[0], i[1], i[2])
        
        if findParent(start) != findParent(end) {
            union(start, end)
            result += cost
        }
    }
    
    return result
}
