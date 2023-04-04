//
//  [Lv2] 1차 뉴스 클러스터링.swift
//  
//
//  Created by 임현규 on 2023/04/04.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    let aArray = str1.map { $0.lowercased() }.map { Character($0) }
    let bArray = str2.map { $0.lowercased() }.map { Character($0) }
    
    var transA = [String]()
    var transB = [String]()
    
    for i in 0..<aArray.count - 1 {
        if aArray[i].isLetter && aArray[i + 1].isLetter {
            transA.append(String(aArray[i]) + String(aArray[i + 1]))
        }
    }
    
    for i in 0..<bArray.count - 1 {
        if bArray[i].isLetter && bArray[i + 1].isLetter {
            transB.append(String(bArray[i]) + String(bArray[i + 1]))
        }
    }
    
    var interCount = 0
    var unionCount = transA.count + transB.count - interCount
    for i in 0..<transA.count {
        for j in 0..<transB.count {
            if transA[i] == transB[j] {
                transB.remove(at: j)
                interCount += 1
                break
            }
        }
    }
    
    unionCount -= interCount
    
    if interCount == 0 && unionCount == 0 {
        return 65536
    } else if interCount == 0 && unionCount != 0  {
        return 0
    } else {
        return Int(trunc((Double(interCount) / Double(unionCount)) * 65536))
    }
}
