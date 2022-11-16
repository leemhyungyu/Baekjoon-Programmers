//
//  Baekjoon1051.swift
//  
//
//  Created by 임현규 on 2022/11/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [[Int]]()

var maxResult = 0
for _ in 1...n {
    array.append(Array(readLine()!.map { Int(String($0))! }))
}

func square(x: Int, y: Int, k: Int) -> Int {
    
    let number = array[x][y]
    
    // y축 상의 같은 숫자 두개 찾음
    if array[x][y] == array[x][k] {
        if k - y + x < n {
            // 같은 위치의 정사각형 좌표 찾음
            if array[k - y + x][y] == number && array[k - y + x][k] == number {
                return Int(pow(Double(k) - Double(y) + 1, 2))
            }
        }
    }
    return 0
}

for i in 0...n - 1 {
    for j in 0...m - 1 {
        for k in j...m - 1 {
            let result = square(x: i, y: j, k: k)
            if result > maxResult {
                maxResult = result
            }
        }
    }
}

print(maxResult)
