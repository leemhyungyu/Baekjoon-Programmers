//
//  Baekjoon20207.swift
//  Solved
//
//  Created by 임현규 on 2024/04/23.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    let calendar = array.sorted { $0[0] == $1[0] ? $0[1] - $0[0] > $1[1] - $1[0]  : $0[0] < $1[0]}
    
    var startDay = 0
    var endDays = [Int]()
    var column = 0
    var result = 0
    var maxEndDay = 0
    
    for i in calendar {
        if endDays.isEmpty {
            endDays = [i[1]]
            startDay = i[0]
            column = 1
            maxEndDay = i[1]
        } else {
            var isFlag = true
            
            for j in 0..<endDays.count {
                if endDays[j] < i[0] && maxEndDay >= i[0] {
                    endDays[j] = i[1]
                    isFlag = false
                    break
                }
            }
            
            if isFlag && maxEndDay >= i[0] {
                endDays.append(i[1])
                column += 1
            } else if isFlag && maxEndDay + 1 < i[0] {
                result += column * (maxEndDay - startDay + 1)
                endDays = [i[1]]
                startDay = i[0]
                column = 1
            }
            maxEndDay = max(maxEndDay, i[1])
        }
    }
    
    result += column * (maxEndDay - startDay + 1)
    
    return result
}

print(solution(array, n))
