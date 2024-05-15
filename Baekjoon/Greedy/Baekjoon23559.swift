//
//  Baekjoon23559.swift
//  Solved
//
//  Created by 임현규 on 2024/05/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], x = input[1]
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ x: Int) -> Int {
    let array = array.sorted { $0[0] - $0[1] == $1[0] - $1[1] ? $0[0] > $1[0] : $0[0] - $0[1] > $1[0] - $1[1]}
    var result = 0
    var dDay = n - 1
    var x = x
    
    for i in array {
        if i[0] - i[1] > 0 && x - 5000 >= dDay * 1000 {
            result += i[0]
            x -= 5000
        } else {
            result += i[1]
            x -= 1000
        }
        dDay -= 1
    }
    
    return result
}

print(solution(array, n, x))
