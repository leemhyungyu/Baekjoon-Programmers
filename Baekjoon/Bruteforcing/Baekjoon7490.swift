//
//  Baekjoon7490.swift
//  
//
//  Created by 임현규 on 2023/06/23.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let number = (1...n).map { $0 }
    let exp = [" ", "+", "-"]
    var expArray = [[String]]()

    dfs([])
    
    // 만들 수 있는 수식 만들기
    func dfs(_ array: [String]) {
    
        if array.count == n - 1 {
            expArray.append(array)
            return
        }
        
        for i in 0..<exp.count {
            dfs(array + [exp[i]])
        }
    }

    for i in 0..<expArray.count {
        var expression = String(number[0])
        for j in 0..<expArray[i].count {
            expression += expArray[i][j] + String(number[j + 1])
        }
        
        if calculate(expression) {
            print(expression)
        }
    }

    print()
}


func calculate(_ expression: String) -> Bool {
    let number = expression.filter { $0 != " " }.split { !$0.isNumber }.map { Int($0)! }
    let exp = expression.filter { $0 != " "}.split { $0.isNumber }
        
    var sum = number[0]
    
    for i in 0..<exp.count {
        if exp[i] == "+" {
            sum = sum + number[i + 1]
        } else {
            sum = sum - number[i + 1]
        }
    }
    
    return sum == 0 ? true : false
}
