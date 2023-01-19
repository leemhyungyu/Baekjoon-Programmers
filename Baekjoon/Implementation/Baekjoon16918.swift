//
//  Baekjoon16918.swift
//  
//
//  Created by 임현규 on 2023/01/19.
//


import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1], n = input[2]
var array = [[String]]()
var timeArray = Array(repeating: Array(repeating: 0, count: c), count: r)
var dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
var time = 1

for _ in 1...r {
    array.append(readLine()!.map { String($0) })
}

if n >= 2 {
    for i in 2...n {
        
        time = i
        
        if time % 2 == 0 {
            setBomber()
        } else {
            startBomb()
        }
    }
}

for i in array {
    for j in i {
        print(j, terminator: "")
    }
    print()
}

func setBomber() {
    for i in 0...r - 1 {
        for j in 0...c - 1 {
            if array[i][j] == "." {
                array[i][j] = "O"
                timeArray[i][j] = time
            }
        }
    }
}

func startBomb() {
    for i in 0...r - 1 {
        for j in 0...c - 1 {
            if array[i][j] == "O" && timeArray[i][j] + 3 == time {
                array[i][j] = "."
                
                for k in dxdy {
                    let nx = k.0 + i
                    let ny = k.1 + j
                
                    if (0...r - 1).contains(nx) && (0...c - 1).contains(ny) {
                        
                        if timeArray[nx][ny] + 3 != time {
                            array[nx][ny] = "."
                            timeArray[nx][ny] = 0
                        }
                    }
                }
            }
        }
    }
}
