//
//  오픈채팅방.swift
//  BackJoon
//
//  Created by 임현규 on 2022/11/22.
//

import Foundation

var userDic = [String: String]()

func solution(_ record:[String]) -> [String] {
    
    var result = [String]()
    
    record.forEach {
        let array = $0.split(separator: " ").map { String($0) }
        
        if array.count > 2 {
            userDic[array[1]] = array[2]
        }
    }
    
    record.forEach {
        let array = $0.split(separator: " ").map { String($0) }
        
        switch array[0] {
        case "Enter":
            result.append("\(userDic[array[1]]!)님이 들어왔습니다.")
        case "Leave":
            result.append("\(userDic[array[1]]!)님이 나갔습니다.")
        
        default:
            break
            
        }
    }

    return result
}
