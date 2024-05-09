//
//  Baekjoon21762.swift
//  Solved
//
//  Created by 임현규 on 2024/05/10.
//

import Foundation

let t = Int(readLine()!)!

func solution(_ x: [String], _ y: [String], _ m: [String]) -> Int {
    var lx = [Int](), rx = [Int](), ly = [Int](), ry = [Int]()
    var dx = Array(repeating: Array(repeating: 0, count: 26), count: x.count + 1)
    var dy = Array(repeating: Array(repeating: 0, count: 26), count: y.count + 1)
    var mIndex = 0

    for i in 1...x.count {
        for j in 0..<26 { dx[i][j] = dx[i - 1][j] }
        dx[i][Int(UnicodeScalar(x[i - 1])!.value) - 97] += 1
        if mIndex < m.count && m[mIndex] == x[i - 1] {
            lx.append(i)
            mIndex += 1
        }
    }
    
    mIndex = 0
    for i in 1...y.count {
        for j in 0..<26 { dy[i][j] = dy[i - 1][j] }
        dy[i][Int(UnicodeScalar(y[i - 1])!.value) - 97] += 1
        
        if mIndex < m.count && m[mIndex] == y[i - 1] {
            ly.append(i)
            mIndex += 1
        }
    }
    
    lx.insert(0, at: 0)
    ly.insert(0, at: 0)
    
    mIndex = m.count - 1
    for i in (0..<x.count).reversed() {
        if mIndex >= 0 && m[mIndex] == x[i] {
            rx.append(i)
            mIndex -= 1
        }
    }
    

    mIndex = m.count - 1
    for i in (0..<y.count).reversed() {
        if mIndex >= 0 && m[mIndex] == y[i] {
            ry.append(i)
            mIndex -= 1
        }
    }
    
    rx.reverse()
    rx.append(x.count)
    ry.reverse()
    ry.append(y.count)

    for i in 0...m.count {
        for j in 0..<26 {
            if rx[i] == lx[i] || ry[i] == ly[i] { continue }
            if dx[rx[i]][j] - dx[lx[i]][j] > 0 && dy[ry[i]][j] - dy[ly[i]][j] > 0 {
                return 1
            }
        }
    }

    return 0
}

for _ in 0..<t {
    let x = readLine()!.map { String($0) }
    let y = readLine()!.map { String($0) }
    let m = readLine()!.map { String($0) }
    print(solution(x, y, m))
}
