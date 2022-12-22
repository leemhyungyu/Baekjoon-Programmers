//
//  Beakjoon2578.swift
//  
//
//  Created by 임현규 on 2022/12/22.
//

import Foundation

var bingoArray = [[Int]]()
var numberArray = [Int]()
var numberCount = 0
var bingoCount = 0

for _ in 1...5 {
    bingoArray.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for _ in 1...5 {
//    numberArray.append(readLine()!.split(separator: " ").map { Int($0)! })
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    input.forEach {
        numberArray.append($0)
    }
}

for i in numberArray {
    numberCount += 1
    for j in 0...4 {
        if let index = bingoArray[j].firstIndex(of: i) {
            bingoArray[j][index] = 0
            break
        }
    }
    
    if checkBingo() {
        print(numberCount)
        break
    }
}


func checkBingo() -> Bool {
    bingoCount = 0
    // 가로
    for i in bingoArray {
        checkCount(i)
    }
    
    // 세로
    for i in 0...4 {
        var checkArray = [Int]()

        for j in 0...4 {
            checkArray.append(bingoArray[j][i])
        }
        
        checkCount(checkArray)
    }
    
    // 좌대각
    var leftCross = [Int]()
    
    for i in 0...4 {
        leftCross.append(bingoArray[i][i])
    }
    
    checkCount(leftCross)
    
    // 우대각
    var rightCross = [Int]()
    
    for i in 0...4 {
        rightCross.append(bingoArray[i][4 - i])
    }
    
    checkCount(rightCross)
    
    // 대각선
    if bingoCount >= 3 {
        return true
    } else {
        return false
    }
}

func checkCount(_ array: [Int]) {
    if array.filter { $0 == 0 }.count == 5 {
        bingoCount += 1
    }
}
