//
//  Baekjoon8911.swift
//  
//
//  Created by 임현규 on 2023/05/11.
//
import Foundation

let t = Int(readLine()!)!

for i in 0..<t {
    let input = readLine()!.map { String($0) }
    var dxdy = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    var x = 0
    var y = 0
    var nowDirection = 0
    var pos = (0, 0, 0, 0) // 최대 X, 최대 Y, 최소 X, 최소 Y

    for i in input {
        if i == "F" {
            x += dxdy[nowDirection].0
            y += dxdy[nowDirection].1
        }

        if i == "B" {

            x -= dxdy[nowDirection].0
            y -= dxdy[nowDirection].1
        }

        if i == "L" {
            nowDirection = changeDirection(nowDirection, true)
        }

        if i == "R" {
            nowDirection = changeDirection(nowDirection, false)
        }

        pos.0 = max(x, pos.0)
        pos.1 = max(y, pos.1)
        pos.2 = min(x, pos.2)
        pos.3 = min(y, pos.3)

    }

    print(abs(pos.0 - pos.2) * abs(pos.1 - pos.3))
}

func changeDirection(_ now: Int, _ type: Bool) -> Int {

    var direction = now

    if type {
        direction = direction - 1
    } else {
        direction = direction + 1
    }

    if direction == -1 { direction = 3 }
    if direction == 4 { direction = 0 }

    return direction
}
