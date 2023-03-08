//
//  Baekjoon2346.swift
//  
//
//  Created by 임현규 on 2023/03/08.
//

import Foundation

let n = Int(readLine()!)!
var balloonArray = readLine()!.split(separator: " ").enumerated().map { ($0, Int($1)!) }

var nowPos = 0
var result = [Int]()

while true {

    let nextPos = balloonArray[nowPos].1

    result.append(balloonArray[nowPos].0 + 1)

    balloonArray.remove(at: nowPos)

    if balloonArray.count == 0 { break }
    if nextPos > 0 {
        nowPos += nextPos - 1
    } else {
        nowPos += nextPos
    }
    
    if nowPos < 0 { nowPos = balloonArray.count + nowPos % balloonArray.count }
    
    nowPos = nowPos % balloonArray.count
}

print(result.map { String($0) }.joined(separator: " "))
