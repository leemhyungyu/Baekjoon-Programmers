//
//  Baekjoon8979.swift
//  Solved
//
//  Created by 임현규 on 7/18/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ n: Int, _ k: Int) -> Int {
    var count = 0
    var result = 1
    let array = array.sorted { $0[1] == $1[1] ? $0[2] == $1[2] ? $0[3] > $1[3] : $0[2] > $1[2] : $0[1] > $1[1] }
    
    
    for i in 0..<n {
        if array[i][0] == k {
            count = i
            result = 1
            while count > 0 {
                if array[count - 1][1..<4] == array[count][1..<4] {
                    count -= 1
                } else {
                    result = count + 1
                    break
                }
            }
        }
    }
    
    return result
}

print(solution(array, n, k))
