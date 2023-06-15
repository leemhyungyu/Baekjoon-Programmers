//
//  거리두기 확인하기.swift
//  
//
//  Created by 임현규 on 2023/06/15.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    var result = [Int]()
    

    
    for i in places {
        var array = [[String]]()
        for j in i {
            array.append(j.map { String($0) })
        }
        
        var flag = true

        for x in 0..<5 {
            for y in 0..<5  {
                if array[x][y] == "P" {
                    if !checkDistance(x, y, array) {
                        flag = false
                    }
                }
                
            }
        }
        result.append(flag ? 1 : 0)
    }
    
    return result
}

// 맨헤튼거리 지켰는지 확인하는 함수
func checkDistance(_ x: Int, _ y: Int, _ array: [[String]]) -> Bool {

    for i in 0..<5 {
        for j in 0..<5 {
            if i == x && j == y { continue }
            
            // 맨헤튼 거리 지켰는지 확인
            if array[i][j] == "P" {
                var menX = abs(i - x)
                var menY = abs(j - y)
                
                // 맨해튼 거리가 2 이하라면
                if menX + menY <= 2 {
                    // 파티션 잘되어있는지 홗인
                    if i == x {
                        if array[x][max(j, y) - 1] != "X" {
                            return false
                        }
                    }
                    
                    if j == y {
                        if array[max(i, x) - 1][y] != "X" {
                            return false
                        }
                    }
                    
                    if j < y {
                        if array[x][y - 1] != "X" || array[i][j + 1] != "X" {
                            return false
                        }
                    }
                    
                    if j > y {
                        if array[x][y + 1] != "X" || array[i][j - 1] != "X" {
                            return false
                        }
                    }
                }
            }
        }
    }
        
    return true
}
