//
//  Baekjoon2870.swift
//  
//
//  Created by 임현규 on 2023/06/03.
//

import Foundation

let n = Int(readLine()!)!
var number = [String]()

for _ in 0..<n {
    let input = readLine()!
    
    var temp = ""
    for i in input {
        if i.isNumber {
            temp += String(i)
        } else {
            if temp.isEmpty { continue }
            number.append(removeZero(temp))
            temp = ""
        }
    }
    
    if temp.isEmpty { continue }
    number.append(removeZero(temp))
}

func removeZero(_ number: String) -> String {
    
    if number.filter { String($0) == "0" }.count == number.count { return
    "0" }
    
    var temp = number
    
    for i in number {
        if String(i) == "0" {
            temp.removeFirst()
        } else {
            break
        }
    }
    
    return temp
}


number.sorted { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }.forEach { print($0) }
