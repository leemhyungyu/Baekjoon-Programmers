//
//  불량 사용자.swift
//  
//
//  Created by 임현규 on 2023/04/13.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    var visited = Array(repeating: false, count: user_id.count)
    var result = Set<[String]>()
    
    var count = 0
    
    func dfs(_ id: [String]) {
        
        if id.count == banned_id.count {
            let sortedId = id.sorted { $0 < $1 }
            result.insert(id.sorted { $0 < $1 })
            return
        }

        
        for i in 0..<user_id.count {
            if !visited[i] && checkId(user_id[i], banned_id[id.count]) {
                visited[i] = true
                dfs(id + [user_id[i]])
                visited[i] = false
            }
        }
    }
    
    dfs([])

    return result.count
}


// 두 문자가 같은 블러처리된 아이디인지 확인하는 함수
func checkId(_ a: String, _ b: String) -> Bool {
    
    var a = a.map { String($0) }, b = b.map { String($0) }
    
    var isCheck = true
    if a.count == b.count {
        
        if b.filter { $0 == "*" }.count == a.count {
            return true
        }
        
        for i in 0..<a.count {
            if b[i] == "*" { continue }
            
            if a[i] != b[i] { isCheck = false }
        }
        
        return isCheck
    } else {
        return false
    }
}
