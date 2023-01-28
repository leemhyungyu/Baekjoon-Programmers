//
//  Baekjoon11501.swift
//  
//
//  Created by 임현규 on 2023/01/28.
//

import Foundation

let t = Int(readLine()!)!

for _ in 1...t {
    let n = Int(readLine()!)!
    let stockArray = readLine()!.split(separator: " ").map { Int($0)! }

    var result = 0
    var maxStockValue = stockArray.last!

    for i in (1...stockArray.count - 1).reversed() {
        
        
        if stockArray[i - 1] < maxStockValue {
            result += maxStockValue - stockArray[i - 1]
        } else {
            maxStockValue = stockArray[i - 1]
        }
    }
    
    print(result)
}
