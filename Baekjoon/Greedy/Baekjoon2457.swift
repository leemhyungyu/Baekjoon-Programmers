//
//  Baekjoon2457.swift
//  
//
//  Created by 임현규 on 2023/02/22.
//

import Foundation

let n = Int(readLine()!)!
var dateArray = [(Int, Int)]()
var result = 0
var endDate = 301
var index = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    dateArray.append((input[0] * 100 + input[1], input[2] * 100 + input[3]))
}

dateArray.sort { $0.0 == $1.0 ? $0.1 > $1.1 : $0.0 < $1.0}

while true {
    
    var chooseEndDate = 0

    for i in index..<dateArray.count {
        
        if dateArray[i].0 <= endDate {
            if chooseEndDate < dateArray[i].1 {
                chooseEndDate = dateArray[i].1
                index += 1
            }
        } else {
            break
        }

    }
    
    if chooseEndDate < endDate {
        result = 0
        break
    }
    
    endDate = chooseEndDate
    result += 1
    
    if endDate >= 1201 {
        break
    }
}

print(result)
