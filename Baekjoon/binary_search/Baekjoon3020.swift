//
//  Baekjoon3020.swift
//  Solved
//
//  Created by 임현규 on 2024/04/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], h = input[1]
var array = [Int]()
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

func solution(_ array: [Int], _ n: Int, _ h: Int) -> [Int] {
    let up = array.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }.sorted { $0 < $1 }
    let down = array.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }.sorted { $0 < $1 }
    var result = Array(repeating: 0, count: h)
    
    for i in 1...h {
        let downCount = binarySearch(down, i)
        let upCount = binarySearch(up, h - i + 1)
        result[i - 1] = downCount + upCount
    }
    
    let min = result.min()!
    return [min, result.filter { $0 == min}.count ]
}


func binarySearch(_ array: [Int], _ target: Int) -> Int {
    var start = 0, end = array.count - 1, count = 0
    while start <= end {
        let mid = (start + end) / 2
        let value = array[mid]
        
        if value >= target {
            end = mid - 1
            count = mid
        } else {
            start = mid + 1
            count = start
        }
    }
    
    return array.count - count
    
}
solution(array, n, h).forEach { print($0, terminator: " ")}

