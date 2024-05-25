//
//  Baekjoon16434.swift
//  Solved
//
//  Created by 임현규 on 5/25/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], attack = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ attack: Int) -> Int {
    var hmaxHp = 0
    var hattack = attack
    var hcurHp = 0

    for i in 0..<array.count {
        let t = array[i][0], a = array[i][1], h = array[i][2]
        if t == 1 {
            let damage = (Int(ceil(Double(h) / Double(hattack))) - 1) * a
            
            if hcurHp >= damage {
                hcurHp -= damage
            } else {
                hmaxHp += damage - hcurHp
                hcurHp = 0
            }
        } else {
            hattack += a
            hcurHp += min(h, hmaxHp)
        }
    }
    
    
    return hmaxHp + 1
}

print(solution(array, n, attack))
