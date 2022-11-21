//
//  Baekjoon17144.swift
//  
//
//  Created by 임현규 on 2022/11/20.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let r = input[0], c = input[1], t = input[2]
let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var array = [[Int]]()
var airPos = [(Int, Int)]()
var tempArray = Array(repeating: Array(repeating: 0, count: c), count: r)

for i in 0...r - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    array.append(input)
    for j in 0...input.count - 1 {
        if input[j] == -1 {
            airPos.append((i, j))
        }
    }
}


// 미세먼지를 네 방향으로 확산하는 함수
func diffusion(x: Int, y: Int) {
    var count = 0
    
    for i in dxdy {
        
        let nx = x + i.0
        let ny = y + i.1
        
        if (0...r - 1).contains(nx) && (0...c - 1).contains(ny) && array[nx][ny] != -1 {
            
            count += 1

            tempArray[nx][ny] += array[x][y] / 5
        }
    }
    
    array[x][y] = array[x][y] - array[x][y] / 5 * count
}

// 공기청정기를 작동시키는 함수
func airForTop() {
    var topAir = (airPos[0].0, airPos[0].1)
        
    let RightBottom = array[topAir.0][c - 1]
    let LeftTop = array[0][0]

    // 위쪽 공기청정기 순환
    array[topAir.0].removeLast()
    array[topAir.0].insert(0, at: 1)
    
    array[0].removeFirst()
    array[0].append(0)
    
    for i in 0...topAir.0 - 1 {
        array[i][c - 1] = array[i + 1][c - 1]
    }
    
    array[topAir.0 - 1][c - 1] = RightBottom

    for i in (0...topAir.0 - 1).reversed() {
        
        if i > 1 {
            array[i][0] = array[i - 1][0]
        } else if i == 0 {
            array[i + 1][0] = LeftTop
        }
    }
}

func airForBottom() {
    
    var bottomAir = (airPos[1].0, airPos[1].0)
    
    var rightTop = array[bottomAir.0][c - 1]
    var leftBottom = array[r - 1][0]
    
    array[bottomAir.0].removeLast()
    array[bottomAir.0].insert(0, at: 1)
    
    array[r - 1].removeFirst()
    array[r - 1].append(0)

    for i in (bottomAir.0 + 1...r - 1).reversed() {

        if i == bottomAir.0 + 1 {
            array[i][c - 1] = rightTop
        } else {
            array[i][c - 1] = array[i - 1][c - 1]
        }
    }
    
    
    for i in bottomAir.0 + 1...r - 2 {
        array[i][0] = array[i + 1][0]
    }
    
    array[r - 2][0] = leftBottom
}


for _ in 1...t {

    tempArray = Array(repeating: Array(repeating: 0, count: c), count: r)
    for i in 0...r - 1 {
        for j in 0...c - 1 {

            if array[i][j] >= 5 {
                diffusion(x: i, y: j)
            }
        }
    }

    for i in 0...r - 1 {
        for j in 0...c - 1 {
            array[i][j] += tempArray[i][j]
        }
    }

    airForTop()
    airForBottom()

}

var total = 0

array.forEach {
    $0.forEach {
        total += $0
    }
}

print(total + 2)
