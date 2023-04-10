//
//  가장 큰 수.swift
//  
//
//  Created by 임현규 on 2023/04/11.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    
    var numArray = numbers.map { String($0) }
    numArray.sort { Int(String($0 + $1))! > Int(String($1 + $0))!}
    
    if numArray.first! == "0" {
        return "0"
    } else {
        return numArray.reduce("") { $0 + $1 }
    }
}
