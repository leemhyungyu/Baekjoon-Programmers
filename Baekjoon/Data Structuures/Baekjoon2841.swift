//
//  Baekjoon2841.swift
//  
//
//  Created by 임현규 on 2023/03/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], p = input[1]

var lineStack = Array(repeating: [Int](), count: 6)
var count = 0

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let line = input[0] - 1, fret = input[1]
    
    while true {
        if lineStack[line].isEmpty || lineStack[line].last! < fret {
               lineStack[line].append(fret)
            count += 1
            break
        } else if lineStack[line].last! == fret {
            break
        } else {
            lineStack[line].removeLast()
            count += 1
        }
    }
}

print(count)
