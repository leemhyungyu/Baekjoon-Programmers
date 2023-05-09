//
//  Baekjoon2607.swift
//  
//
//  Created by 임현규 on 2023/05/09.
//

import Foundation

let n = Int(readLine()!)!
var list = [String]()

for _ in 0..<n {
    list.append(readLine()!)
}

func solution(_ list: [String]) -> Int {
    
    var count = 0
    
    for i in 1..<list.count {
        var firstNumDic = [String: Int]()
        
        list.first!.map { String($0) }.forEach {
            firstNumDic[$0] = (firstNumDic[$0] ?? 0) + 1
        }
        
        for j in list[i] {
            let target = String(j)
            firstNumDic[target] = (firstNumDic[target] ?? 0) - 1
        }
        
        let filterDic = firstNumDic.filter { $0.value != 0 }
        
        if filterDic.isEmpty {
            count += 1
            continue
        }

        if (-1...1).contains(filterDic.reduce(0) { $0 + $1.value }) {
            if filterDic.count > 2 { continue }
            if abs(filterDic.sorted { abs($0.value) > abs($1.value) }.first!.value) >= 2 { continue }
            
            count += 1
        }
    }
    
    return count
}

print(solution(list))
