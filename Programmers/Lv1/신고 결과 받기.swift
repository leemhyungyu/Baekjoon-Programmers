//
//  신고 결과 받기.swift
//  
//
//  Created by 임현규 on 2024/03/22.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result = Array(repeating: 0, count: id_list.count)
    var stopDic = [String: Set<String>]()
    var reportDic = [String: Set<String>]()
    
    for i in report {
        let info = i.split(separator: " ").map { String($0) }
        let a = info[0], b = info[1]
        
        if stopDic[b] == nil {
            stopDic[b] = [a]
        } else {
            stopDic[b]?.insert(a)
        }
        
        if reportDic[a] == nil {
            reportDic[a] = [b]
        } else {
            reportDic[a]?.insert(b)
        }
    }
    
    for i in 0..<id_list.count {
        result[i] += (reportDic[id_list[i]] ?? []).filter { (stopDic[$0] ?? []).count >= k }.count
    }
    
    
    return result
}
