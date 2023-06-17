//
//  Baekjoon14888.swift
//  
//
//  Created by 임현규 on 2023/06/17.
//

import Foundation

var n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ numbers: [Int], _ operators: [Int]) {
    var result = [Int]()
    
    var operatorSet = Set<[Int]>()
    var operatorArray = [Int]()
    // + : 1, - : 2, * = 3, / = 4
    
    for i in 0..<operators.count {
        if operators[i] != 0 {
            for _ in 0..<operators[i] {
                operatorArray.append(i + 1)
            }
        }
    }
    
    var visited = Array(repeating: false, count: operatorArray.count)
        
    var check = Array(repeating: false, count: 5)
    
    // 해당 연산자로 만들 수 있는 경우의 수
    func makeOperator(_ operators: [Int]) {
        
        if operators.count == numbers.count - 1 {
            operatorSet.insert(operators)
            return
        }
        
        for i in 0..<operatorArray.count {
            if visited[i] { continue }
                        
            visited[i] = true
            makeOperator(operators + [operatorArray[i]])
            visited[i] = false
        }
    }
    
    
    for i in 0..<operatorArray.count {
        
        if check[operatorArray[i]] { continue }
        
        check[operatorArray[i]] = true
        visited[i] = true
        makeOperator([operatorArray[i]])
        visited[i] = false
    }
    

    // 경우의수를 토대로 숫자를 연산
    for i in operatorSet {
        // ex) [1, 2, 3]
        var temp = calculate(numbers[0], numbers[1], i[0])
        
        for j in 2..<numbers.count {
            temp = calculate(temp, numbers[j], i[j - 1])
        }
        
        result.append(temp)
        
    }

    print(result.max()!)
    print(result.min()!)
}

func calculate(_ one: Int, _ two: Int, _ operators: Int) -> Int {

    switch operators {
    case 1:
        return one + two
    case 2:
        return one - two
    case 3:
        return one * two
    default:
        return one / two
    }
}

solution(numbers, operators)
