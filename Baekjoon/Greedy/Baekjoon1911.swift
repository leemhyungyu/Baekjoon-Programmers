//
//  Baekjoon1911.swift
//  Solved
//
//  Created by 임현규 on 2024/05/14.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], l = input[1]
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}


func solution(_ array: [[Int]], _ n: Int, _ l: Int) -> Int {
    let array = array.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    var pos = 0
    var count = 0
    for i in array {
        var start = i[0], end = i[1]
    
        // 널빤지의 위치가 이미 조금 덮은 경우
        if pos >= start {
            start = pos // pos 위치부터 웅덩이 덮으면 됨
        }
        
        let useCount = Int(ceil(Double(end - start) / Double(l)))
        count += useCount
        pos = start + useCount * l
    }
    
    return count
}

print(solution(array, n, l))
