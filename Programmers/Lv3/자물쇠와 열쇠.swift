//
//  자물쇠와 열쇠.swift
//  CodingTest
//
//  Created by 임현규 on 2023/06/10.
//

import Foundation

var dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)] // 상, 하, 좌, 우

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {

    var n = lock.count, m = key.count
    var key = key
    var array = Array(repeating: Array(repeating: 0, count: 2 * m + n), count: 2 * m + n)
    var result = false
    for i in 0..<n {
        for j in 0..<n {
            array[i + m][j + m] = lock[i][j]
        }
    }

    for _ in 0..<4 {
        key = rotate(key)
        for i in 0..<m + n {
            for j in 0..<m + n {
            // i, j가 열쇠의 시작 위치
            
                for x in 0..<m {
                    for y in 0..<m {
                        array[i + x][j + y] += key[x][y]
                    }
                }
            
                if isLock(array, n, m) { // lock 구간의 값이 모두 1이면
                    result = true
                }
            
                for x in 0..<m {
                    for y in 0..<m {
                        array[i + x][j + y] -= key[x][y]
                    }
                }
            }
        }
    
    }

    return result
}

// 키를 90도 회전시키는 함수
func rotate(_ key: [[Int]]) -> [[Int]] {
    
    var temp = Array(repeating: Array(repeating: 0, count: key.count), count: key.count)
    
    for i in 0..<key.count {
        for j in 0..<key.count {
            temp[j][key.count - i - 1] = key[i][j]
        }
    }
    return temp
}

// lock 구간의 값이 모두 1인지 확인하는 함수
func isLock(_ array: [[Int]], _ n: Int, _ m: Int) -> Bool {
    
    var flag = true
        
    for i in 0..<n {
        for j in 0..<n {
            if array[i + m][j + m] == 0 || array[i + m][j + m] == 2 {
                flag = false
            }
        }
    }
        
    return flag
}
