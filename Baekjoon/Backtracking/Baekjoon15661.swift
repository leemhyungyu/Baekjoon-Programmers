//
//  Baekjoon15661.swift
//  Solved
//
//  Created by 임현규 on 2024/04/30.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int) -> Int {
    var visited = Array(repeating: false, count: n)
    let member = Set((0..<n))
    var result = Int.max
    
    func getScore(_ team: Set<Int>) -> Int {
        let teamArray = Array(team)
        var score = 0
        for i in 0..<teamArray.count {
            for j in i + 1..<teamArray.count {
                score += array[teamArray[i]][teamArray[j]]
                score += array[teamArray[j]][teamArray[i]]
            }
        }
        
        return score
    }
    
    func dfs(_ now: Int, _ team: Set<Int>) {
        
        if (1..<n).contains(team.count) {
            let startTeam = team
            let linkTeam = member.subtracting(startTeam)
            let startTeamScore = getScore(team)
            let linkTeamScore = getScore(linkTeam)
            result = min(result, abs(startTeamScore - linkTeamScore))
        }
        
        for i in now..<n {
            if visited[i] { continue }
            visited[i] = true
            var newTeam = team
            newTeam.insert(i)
            dfs(i, newTeam)
            visited[i] = false
        }
    }
    
    dfs(0, [])
    
    return result
}

print(solution(array, n))
