//
//  Baekjoon16236.swift
//  
//
//  Created by 임현규 on 2022/11/18.
//

import Foundation

let n = Int(readLine()!)!
var array = [[Int]]()
var shark: (Int, Int, Int) = (0, 0, 2) // 현재 상어의 x, y, level
var time = 0
var count = 0
var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌, 우 이동 값

for i in 0...(n - 1) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    array.append(input)

    if let j = input.firstIndex(of: 9) {
        shark = (i, j, 2)
        array[i][j] = 0
    }
}

func bfs() -> Bool {
    var biteArray = [(Int, Int, Int)]()
    var queue = [(shark.0, shark.1, 0)] // (x, y, dist)
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)

    while !queue.isEmpty {

        let queueLeft = queue.removeFirst()

        let x = queueLeft.0, y = queueLeft.1, dist = queueLeft.2

        for i in dxdy {
            let nx = x + i.0
            let ny = y + i.1

            // 방문하지 않았고, 그래프 범위를 벗어나지 않고, 이동해야할 좌표의 크기가 상어의 크기보다 작을거나 같을 때 이동
            if (0...n - 1).contains(nx) && (0...n - 1).contains(ny) && !visited[nx][ny] && array[nx][ny] <= shark.2  {
                
                // 추가된 물고기보다 거리가 먼 물고기를 탐색하면 bfs종료
                if biteArray.count > 0 {
                    if biteArray.last!.2 < dist + 1 {
                        break
                    }
                }
                
                // 방문하는 좌표가 먹을 수 있는 좌표면
                if (1...shark.2 - 1).contains(array[nx][ny]) {
                    biteArray.append((nx, ny, dist + 1))
                }
                
                visited[nx][ny] = true
                queue.append((nx, ny, dist + 1))
            }
        }
    }

    if biteArray.isEmpty {
        return false
    }
    
    // biteArray에는 거리가 같은 물고기들만 들어옴
    // 1. 가장 위에 있는 물고기를 먹는다. 2. 가장 위에 있는 물고기가 여러개면 가장 왼쪽에 있는 물고기를 먹는다.
    biteArray.sort {
        $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0
    }
    
    let bite = biteArray.removeFirst()
    // biteArray에서 정렬된 물고기중 첫번째꺼만 먹음
    shark.0 = bite.0
    shark.1 = bite.1

    time += bite.2
    count += 1
    array[bite.0][bite.1] = 0

    if count == shark.2 {
        shark.2 += 1
        count = 0
    }

    return true
}

while true {
    if !bfs() {
        print(time)
        break
    }
}
