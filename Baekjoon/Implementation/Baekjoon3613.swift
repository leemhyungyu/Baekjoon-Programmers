//
//  Baekjoon3613.swift
//  
//
//  Created by 임현규 on 2023/06/04.
//

import Foundation

let name = String(readLine()!)

if checkString(name) {
    if name.contains("_") {
        
        
        let split = name.split(separator: "_").map { String($0) }
        var c = ""

        c += split[0]
        
        for i in 1..<split.count {
            let content = split[i].map { String($0) }
           
            
            c += content[0].uppercased()
            content[1..<content.count].forEach {
                c += $0
            }
        }
        
        print(c)
            
        
    } else { // Java 형식이면 -> C++
        
        var java = ""
        var temp = ""
        
        for i in name {
            if i.isUppercase {
                java += temp
                java += "_"
                temp = String(i).lowercased()
            } else {
                temp += String(i)
            }
        }
        
        java += temp
        
        print(java)
    }
} else {
    print("Error!")
}
// C++형식이면 -> Java


func checkString(_ name: String) -> Bool {
    
    if name.last! == "_" || name.first == "_" || name.first!.isUppercase  || (name.filter { $0 == "_" }.count > 0 && name.filter { $0.isUppercase }.count > 0) {
        return false
    }
    
    var count = 0
    
    for i in name {
        if String(i) == "_" {
            count += 1
        } else {
            count = 0
        }
        
        if count >= 2 {
            return false
        }
    }
    
    return true
}
