//
//  Baekjoon2852.swift
//  
//
//  Created by 임현규 on 2023/05/13.
//

import Foundation

let n = Int(readLine()!)!
var goal = [(String, String)]()
var score = 0
var one = 0
var two = 0
var targetTime = ""

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let team = input[0], time = input[1]
    goal.append((team, time))
}

goal.append(("0", "48:00"))


for i in goal {
    if score > 0 {
        
        one += setTimeForInt(i.1) - setTimeForInt(targetTime)
        
    } else if score < 0 {
        two += setTimeForInt(i.1) - setTimeForInt(targetTime)
    }
    
    targetTime = i.1
    
    if i.0 == "1" {
        score += 1
    } else if i.0 == "2" {
        score -= 1
    }
}

func setTimeForString(_ time: Int) -> String {
    
    var min = String(time / 60)
    var second = String(time % 60)
    
    if time / 60 < 10 {
        min = "0" + String(time / 60)
    }
    
    if time % 60 < 10 {
        second = "0" + String(time % 60)
    }
    
    return min + ":" + second
}

func setTimeForInt(_ time: String) -> Int {
    
    let time = time.split(separator: ":").map { Int($0)! }

    return time[0] * 60 + time[1]
}

print(setTimeForString(one))
print(setTimeForString(two))
