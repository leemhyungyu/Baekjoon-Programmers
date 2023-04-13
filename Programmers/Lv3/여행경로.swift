//
//  여행경로.swift
//  
//
//  Created by 임현규 on 2023/04/14.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    var sortedTicket = tickets.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]  }
    var queue = [("ICN", ["ICN"])]
    var visited = Array(repeating: false, count: sortedTicket.count)
    var result = Set<[String]>()
    var route = [[String]]()

    func dfs(_ route: [String], _ start: String) {
        
        if visited.filter { !$0 }.count == 0 {
            
            result.insert(route)
            return
        }
        
        let filterTicket = sortedTicket.filter { $0[0] == start }
        
        for i in filterTicket {
            for j in 0..<sortedTicket.count {
                if !visited[j] {
                    if sortedTicket[j] == i {
                        visited[j] = true
                        dfs(route + [sortedTicket[j][1]], sortedTicket[j][1])
                        visited[j] = false
                        break
                    }
                }
            }
        }
    }

    dfs(["ICN"], "ICN")

    let sorted = result.sorted { $0.joined() < $1.joined() }
    return sorted.first!
}
