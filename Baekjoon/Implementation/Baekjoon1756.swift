//
//  Baekjoon1756.swift
//  Solved
//
//  Created by 임현규 on 2024/04/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let d = input[0], n = input[1]
let oven = readLine()!.split(separator: " ").map { Int($0)! }
let pizza = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ oven: [Int], _ pizza: [Int], _ d: Int, _ n: Int) -> Int {
    var oven = oven
    var pizzaIndex = 0
    var height = 0
    
    for i in 1..<d {
        oven[i] = min(oven[i], oven[i - 1])
    }
    
    for i in (0..<d).reversed() {
        if pizzaIndex == n { break }
        
        if pizza[pizzaIndex] <= oven[i] {
            pizzaIndex += 1
            height = i
        }
    }
    
    return pizzaIndex == n ? height + 1 : 0
}

print(solution(oven, pizza, d, n))

