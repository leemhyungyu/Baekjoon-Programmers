//
//  Baekjoon2564.swift
//  
//
//  Created by 임현규 on 2023/05/31.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)!}
let n = Int(readLine()!)!
let width = input[0], height = input[1] // 가로, 세로
var storeArray = [(Int, Int)]()
var dongPos = (0, 0)
var result = 0

for _ in 0...n {
    let pos = readLine()!.split(separator: " ").map { Int($0)! }
    storeArray.append((pos[0], pos[1]))
}

dongPos = storeArray.removeLast()

func solution(_ storeArray: [(Int, Int)]) -> Int {
    storeArray.forEach {
        result += getDistance($0)
    }
    return result
}

func getDistance(_ pos: (Int, Int)) -> Int {
    
    if pos.0 == dongPos.0 {
        return abs(pos.1 - dongPos.1)
    }
    
    if pos.0 == 1 && dongPos.0 == 2 || pos.0 == 2 && dongPos.0 == 1 {
        let clock = width - pos.1 + height + width - dongPos.1
        let nonClock = pos.1 + height + dongPos.1
        return min(clock, nonClock)
    } else if pos.0 == 1 && dongPos.0 == 3 || pos.0 == 3 && dongPos.0 == 1 {
        return pos.1 + dongPos.1
    } else if pos.0 == 1 && dongPos.0 == 4 || pos.0 == 4 && dongPos.0 == 1 {
        return pos.0 == 1 ? width - pos.1 + dongPos.1 : width - dongPos.1 + pos.1
    } else if pos.0 == 2 && dongPos.0 == 3 || pos.0 == 3 && dongPos.0 == 2 {
        return pos.0 == 2 ? pos.1 + height - dongPos.1 : dongPos.1 + height - pos.1
    } else if pos.0 == 2 && dongPos.0 == 4 || pos.0 == 4 && dongPos.0 == 2 {
        return pos.0 == 2 ? width - pos.1 + height - dongPos.1 : width - dongPos.1 + height - pos.1
    } else {
        let clock = width + pos.1 + dongPos.1
        let nonClock = width + height * 2 - pos.1 - dongPos.1
        return min(clock, nonClock)
    }
}

print(solution(storeArray))
