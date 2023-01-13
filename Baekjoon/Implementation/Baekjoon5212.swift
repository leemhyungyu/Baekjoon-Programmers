//
//  Baekjoon5212.swift
//  
//
//  Created by 임현규 on 2023/01/14.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1]
var mapArray = [[String]]()
var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌, 우
var left = c, right = 0, top = r, bottom = 0

for _ in 1...r {
    let input = readLine()!.map { String($0) }
    mapArray.append(input)
}

for i in 0...mapArray.count - 1 {
    for j in 0...mapArray[i].count - 1 {
        if mapArray[i][j] == "X" {
            var count = 0

            for k in dxdy {
                var nx = i + k.0
                var ny = j + k.1
                
                if (0...r - 1).contains(nx) && (0...c - 1).contains(ny) {
                    if mapArray[nx][ny] == "." {
                        count += 1
                    }
                }
                
                if nx == -1 || nx == r || ny == -1 || ny == c {
                    count += 1
                }
            }
            
            if count >= 3 {
                mapArray[i][j] = "O"
            }
        }
    }
}

for i in 0...mapArray.count - 1 {
    for j in 0...mapArray[i].count - 1 {
        if mapArray[i][j] == "X" {
            if i < top {
                top = i
            } else if i > bottom {
                bottom = i
            }
            if j < left {
                left = j
            } else if j > right {
                right = j
            }
        } else if mapArray[i][j] == "O" {
            mapArray[i][j] = "."
        }
    }
}

if mapArray.map { $0.filter { $0 == "X" }}.filter { $0 == ["X"] }.count == 1 {
    print("X")
} else {
    for i in top...bottom {
        for j in left...right {
            print(mapArray[i][j], terminator: "")
        }
        print()
    }
}
