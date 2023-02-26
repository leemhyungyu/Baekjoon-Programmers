//
//  Baekjoon2164.swift
//  
//
//  Created by 임현규 on 2023/02/26.
//

import Foundation

var cardArray = Array(1...Int(readLine()!)!)
var index = 0

while cardArray.count != 1 {
    cardArray[index] = 0
    cardArray.append(cardArray[index + 1])
    cardArray[index + 1] = 0
    
    if cardArray[cardArray.count - 2] == 0 {
        break
    }
    
    index += 2
}

print(cardArray.last!)
