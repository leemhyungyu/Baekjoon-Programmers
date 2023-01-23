//
//  Baekjoon2116.swift
//  
//
//  Created by 임현규 on 2023/01/23.
//

import Foundation

let n = Int(readLine()!)!
var diceArray = [[Int]]()
var resultArray = Array(repeating: 0, count: 7)

for _ in 1...n {
    diceArray.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0...5 {
    
    var top = diceArray[0][i]
    var bottom = diceArray[0][targetIndexNumber(i)]
    
    resultArray[i] += (1...6).filter { $0 != top && $0 != bottom }.max()!
        
    for j in 1...diceArray.count - 1 {
        let bottomIndex = diceArray[j].firstIndex(of: top)!
        let topIndex = targetIndexNumber(bottomIndex)
        top = diceArray[j][topIndex]
        bottom = diceArray[j][bottomIndex]
        resultArray[i] += (1...6).filter { $0 != top && $0 != bottom}.max()!
    }
}

print(resultArray.max()!)

func targetIndexNumber(_ number: Int) -> Int {
    switch number {
    case 0:
        return 5
    case 1:
        return 3
    case 2:
        return 4
    case 3:
        return 1
    case 4:
        return 2
    case 5:
        return 0
    default:
        return 0
    }
}

