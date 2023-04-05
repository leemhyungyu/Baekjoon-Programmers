//
//  방문 길이.swift
//  
//
//  Created by 임현규 on 2023/04/06.
//

import Foundation

func solution(_ dirs:String) -> Int {
    
    var direction = ["U": (0, 1), "D": (0, -1), "R": (1, 0), "L": (-1, 0)]
    var nowPos = (0, 0)
    var posArray = [[Int]]()
    
    for i in dirs {
        
        if (-5...5).contains(nowPos.0 + direction[String(i)]!.0) && (-5...5).contains(nowPos.1 + direction[String(i)]!.1) {
            let from = [nowPos.0, nowPos.1, direction[String(i)]!.0 + nowPos.0, direction[String(i)]!.1 + nowPos.1]
            let to = [direction[String(i)]!.0 + nowPos.0, direction[String(i)]!.1 + nowPos.1, nowPos.0, nowPos.1]

            nowPos = (nowPos.0 + direction[String(i)]!.0, nowPos.1 + direction[String(i)]!.1)
            
            if !posArray.contains(from) {
                posArray.append(from)
            }
            
            if !posArray.contains(to) {
                posArray.append(to)
            }
        }
    }
    
    
    return posArray.count / 2
}
