//
//  Baekjoon12891.swift
//  
//
//  Created by 임현규 on 2023/06/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let s = input[0], p = input[1]
var words = readLine()!.map { String($0) }
var min = readLine()!.split(separator: " ").map { Int($0)! }
var dna = ["A", "C", "G", "T"]
var dnaDic = ["A": 0, "C": 0, "G": 0, "T": 0]
var result = 0

func solution(_ words: [String]) -> Int {
    
    // DNA문자열이 최소 개수의 조건에 맞지 않는 경우
    if words.filter { $0 == "A" }.count < min[0] ||
    words.filter { $0 == "C" }.count < min[1] ||
    words.filter { $0 == "G" }.count < min[2] ||
    words.filter { $0 == "T" }.count < min[3] {
        return 0
    }
    
    var left = 0, right = p - 1
    
    for i in left..<right {
        dnaDic[words[i]] = (dnaDic[words[i]] ?? 0) + 1
    }
    
    while right < words.count {
        dnaDic[words[right]]! += 1

        var check = true
        
        for i in 0..<4 {
            if dnaDic[dna[i]]! < min[i] {
                check = false
            }
        }
        
        if check {
            result += 1
        }
        
        dnaDic[words[left]]! -= 1

        left += 1
        right += 1
    }

    return result
}

print(solution(words))
