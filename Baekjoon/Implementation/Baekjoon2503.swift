//
//  Baekjoon2503.swift
//  
//
//  Created by 임현규 on 2022/12/04.
//

import Foundation

let n = Int(readLine()!)!
var numberArray = [[Int]]()
var countTuple = [(Int, Int)]()
var count = 0

for _ in 0...n - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    numberArray.append(String(input[0]).map { Int(String($0))! })
    countTuple.append((input[1], input[2]))
}

// 해당 숫자가 조건에 만족하는 숫자인지 확인하는 함수
func checkStrikeBall(number: Int) -> Bool {
    
    var index = 0


    let first = number / 100
    let second = number % 100 / 10
    let thrid = number % 100 % 10

    while index < numberArray.count {
        var strike = 0
        var ball = 0
        
        if numberArray[index].contains(first) {
            if numberArray[index][0] == first {
                strike += 1
            } else {
                ball += 1
            }
        }
        
        if numberArray[index].contains(second) {
            if numberArray[index][1] == second {
                strike += 1
            } else {
                ball += 1
            }
        }
        
        if numberArray[index].contains(thrid) {
            if numberArray[index][2] == thrid {
                strike += 1
            } else {
                ball += 1
            }
        }
        
        if strike != countTuple[index].0 || ball != countTuple[index].1 {
            return false
        }
        
        index += 1
    }
    
    return true
}


// 서로 다른 세 개의 숫자이고 0이 포함되지 않은 숫자인지 확인하는 함수
func checkNumber(number: Int) -> Bool {

    let first = number / 100
    let second = (number % 100) / 10
    let thrid = (number % 100) % 10

    if first != second && first != thrid && second != thrid && first != 0 && second != 0 && thrid != 0{
        return true
    } else {
        return false
    }
}

for i in 123...987 {
    if checkNumber(number: i) {
        if checkStrikeBall(number: i) {
            count += 1
        }
    }
}

print(count)
