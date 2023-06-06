//
//  Baekjoon2002.swift
//  
//
//  Created by 임현규 on 2023/06/06.
//

import Foundation

let n = Int(readLine()!)!
var inner = [String]()
var out = [String]()
var result = 0

for _ in 0..<n {
    inner.append(String(readLine()!))
}

for _ in 0..<n {
    out.append(String(readLine()!))
}

func solution(_ inner: [String], _ out: [String]) -> Int {
       
    var innerDic = [String: Int]()
    
    for i in 0..<inner.count {
        innerDic[inner[i]] = i
    }
    
    for i in 1..<out.count {
        for j in 0...i {
            if innerDic[out[j]]! == 0 { continue }
            
            if innerDic[out[i]]! < innerDic[out[j]]! {
                innerDic[out[j]]! = 0
                result += 1
            }
        }
    }
  
    return result
}

print(solution(inner, out))
