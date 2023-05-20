//
//  Baekjoon14889.swift
//  
//
//  Created by 임현규 on 2023/05/20.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
var startTeam = Set<[Int]>()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}


func solution(_ array: [[Int]]) -> Int {
    
    var result = Int.max
    
    setStartTeam([0])
    
    for i in startTeam {

        var linkTeam = [Int]()

        (0..<n).forEach {
            if !i.contains($0) {
                linkTeam.append($0)
            }
        }

        result = min(abs(findTeamValue(i) - findTeamValue(linkTeam)), result)
    }

    return result
}

func setStartTeam(_ firstMember: [Int]) {
    
    if firstMember.count == n / 2 {
        startTeam.insert(firstMember.sorted())
        return
    }
    
    for i in firstMember.last! + 1..<n {
        setStartTeam(firstMember + [i])
    }
}

func findTeamValue(_ member: [Int]) -> Int {
    
    var result = 0
    
    for i in member {
        for j in member {
            result += array[i][j]
        }
    }
    
    return result
}

print(solution(array))
