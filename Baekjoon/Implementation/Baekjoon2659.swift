//
//  Baekjoon2659.swift
//  
//
//  Created by 임현규 on 2023/05/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ corner: [Int]) -> Int {
    
    let num = findClockNumber(corner)
    var set = Set<Int>()
    var count = 1

    for i in 1111...9999 {
        let card = String(i).map { Int(String($0))! }.filter { $0 != 0 }
        
        if card.count < 4 { continue }
        
        let targetNum = findClockNumber(card)
        
        if set.contains(targetNum) { continue }
        
        set.insert(targetNum)
        
        if targetNum < num {
            print(targetNum)
            count += 1
        }
    }
    return count
}

func findClockNumber(_ card: [Int]) -> Int {

    var list = card
        
    var temp = Int(card.map { String($0) }.reduce("") { $0 + $1 })!
    
    for _ in 0..<3 {
        list.append(list.removeFirst())
        
        let targetNum = Int(list.map { String($0) }.reduce("") { $0 + $1 })!
        if temp > targetNum {
            temp = targetNum
        }
    }
    
    return temp
}

print(solution(input))
