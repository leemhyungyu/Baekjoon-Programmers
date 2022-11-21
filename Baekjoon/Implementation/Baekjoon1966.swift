//
//  Baekjoon1966.swift
//  
//
//  Created by 임현규 on 2022/10/06.
//

import Foundation

let caseNum = Int(readLine()!)!

for _ in 1...caseNum {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let n = input[0]
    let m = input[1]
    
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    
    findPrintNum(n, m, array)
    
}

func findPrintNum(_ n: Int, _ m: Int, _ array: [Int]) {

    var tuple = [(Int, Int)]()
    var tempArr = array.sorted()
    
    for i in 0...array.count - 1 {
        tuple.append((array[i], i))
    }
    
    var result = 1
    
    while true {
        if tuple[0].0 == tempArr.max()! {
            if tuple[0].1 == m {
                print(result)
                break
            } else {
                tuple.removeFirst()
                tempArr.removeLast()
                result += 1
            }
        } else {
            tuple.append(tuple.first!)
            tuple.removeFirst()
        }
    }
}
