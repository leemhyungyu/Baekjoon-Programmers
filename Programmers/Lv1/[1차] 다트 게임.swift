//
//  [1차] 다트 게임.swift
//  
//
//  Created by 임현규 on 2024/03/19.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    let dartResult = dartResult.map { String($0) }
    var result = 0
    var tempResult = [Int]()
    var temp = ""
    
    for i in 0..<dartResult.count {
        var number = 0
        if "0123456789".contains(dartResult[i]) {
            temp += dartResult[i]
            continue
        } else if temp != "" {
            number = Int(temp)!
            temp = ""
        }
        
        switch dartResult[i] {
            case "S":
                tempResult.append(number)
            case "D":
                tempResult.append(number * number)
            case "T":
                tempResult.append(number * number * number)
            case "*":
                if tempResult.count - 2 >= 0 { tempResult[tempResult.count - 2] *= 2 }
                tempResult[tempResult.count - 1] *= 2
            case "#":
                tempResult[tempResult.count - 1] *= -1
            default: continue
        }
    }

    return tempResult.reduce(0) { $0 + $1 }
}
