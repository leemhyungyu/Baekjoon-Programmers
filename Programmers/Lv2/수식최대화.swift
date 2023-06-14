//
//  수식최대화.swift
//  
//
//  Created by 임현규 on 2023/06/14.
//

import Foundation

func solution(_ expression:String) -> Int64 {

    var minusCount = 0
    var plusCount = 0
    var multiCount = 0
    var orderSet = Set<[String]>() // 우선순위 Set
    var defaultExpression = [String]() // 원래 연산자 배열
    var numberArray = expression.split { // 원래 숫자 배열
        if $0 == "-" {
            minusCount += 1
            defaultExpression.append(String($0))
            return true
        } else if $0 == "+" {
            plusCount += 1
            defaultExpression.append(String($0))
            return true
        } else if $0 == "*" {
            multiCount += 1
            defaultExpression.append(String($0))
            return true
        } else {
            return false
        }
    }
    
    var expressionArray = [String]()

    if minusCount > 0 {
        expressionArray.append("-")
    }
    
    if plusCount > 0 {
        expressionArray.append("+")
    }
    
    if multiCount > 0 {
        expressionArray.append("*")
    }
    
    var visited = Array(repeating: false, count: expressionArray.count)
    
    // 모든 우선순위 경우의 수 추가
    func orderExpression(_ order: [String]) {
        
        if order.count == expressionArray.count {
            orderSet.insert(order)
        }
        
        for i in 0..<expressionArray.count {
            if visited[i] { continue }
            
            visited[i] = true
            orderExpression(order + [expressionArray[i]])
            visited[i] = false
        }
    }
    
    for i in 0..<expressionArray.count {
        visited[i] = true
        orderExpression([expressionArray[i]])
        visited[i] = false
    }
    
    // 모든 우선순위 탐색
    var result = 0
    
    for i in orderSet {
        var expressionTemp = defaultExpression
        var numberTemp = numberArray.map { Int($0)! }
        var index = 0
        
        for j in i {
            
            while !expressionTemp.isEmpty {
                
                if index >= expressionTemp.count { // 다돌았을 때 찾는 연사자가 없으면
                    index = 0
                    break
                }
                
                if expressionTemp[index] != j { // 찾는 연산자가 아니면
                    index += 1
                    continue
                }
                
                let result = calculateNumber(numberTemp[index], numberTemp[index + 1], j)
                
                numberTemp.remove(at: index)
                numberTemp.remove(at: index)
                numberTemp.insert(result, at: index)
                
                expressionTemp.remove(at: index)
                
                index = 0
            }
        }
        
        result = max(result, abs(numberTemp.first!))
    }
    
    return Int64(result)
}

func calculateNumber(_ one: Int, _ two: Int, _ expression: String) -> Int {
    
    if expression == "+" {
        return one + two
    } else if expression == "-" {
        return one - two
    } else {
        return one * two
    }
}
