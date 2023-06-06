//
//  Baekjoon3107.swift
//  
//
//  Created by 임현규 on 2023/06/06.
//

import Foundation

let ip = String(readLine()!)

func solution(_ ip: String) -> String {
    
    var result = [String]()
    
    ip.split(separator: ":").forEach {
        var temp = ""
        
        for _ in 0..<4 - $0.count {
            temp += "0"
        }
        
        result.append(temp + $0)
    }
    
    let index = ip.components(separatedBy: "::").first!.split(separator: ":").count
    
    for _ in 0..<8 - result.count {
        result.insert("0000", at: index)
    }
    
    return result.joined(separator: ":")
}

print(solution(ip))
