//
//  Baekjoon16234.swift
//  
//
//  Created by 임현규 on 2022/11/14.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

var n = input[0], l = input[1], r = input[2]

var array = [[Int]]()
var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌,우
var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
for _ in 1...n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}


func bfs(x: Int, y: Int) -> [(Int, Int)] {
    
    var queue = [(x, y)]
    var tempArray = [(Int, Int)]()

    while !queue.isEmpty {
        let queueLeft = queue.removeFirst()
        
        let x = queueLeft.0
        let y = queueLeft.1

        for i in dxdy {
            let nx = i.0 + x
            let ny = i.1 + y
            
            if (0 <= nx && nx < n) && (0 <= ny && ny < n) && visited[nx][ny] == 0 {
                if abs(array[x][y] - array[nx][ny]) >= l && abs(array[x][y] - array[nx][ny]) <= r {
                    visited[nx][ny] = 1
                    queue.append((nx, ny))
                    tempArray.append((nx, ny))
                }
            }
        }
    }
    
    return tempArray
}

var result = 0
var count = 0

while true {

    visited = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    result = 0
    
    for i in 0...(n - 1) {
        for j in 0...(n - 1) {
            if visited[i][j] == 0 {
                let country = bfs(x: i, y: j)

                if country.count > 1 {
                    result = 1
                    
                    var average = 0
                    country.forEach({ (x, y) in
                        average += array[x][y]
                    })

                    average /= country.count
                    
                    country.forEach { (x, y) in
                        array[x][y] = average
                    }
                }
            }
        }
    }
    
    if result == 0 {
        break
    }
    count += 1
}

print(count)
