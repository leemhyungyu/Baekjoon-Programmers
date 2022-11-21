//
//  Baekjoon14503.swift
//  
//
//  Created by 임현규 on 2022/10/31.
//

import Foundation

class Robot {
    var nowPos: (Int, Int) = (0, 0)
    var d: Int = 0
    
    init(nowPos: (Int, Int), d: Int) {
        self.nowPos = nowPos
        self.d = d
    }
    
    func clean() {
        
        var leftPos: (Int, Int) = (0, 0)
        var backPos: (Int, Int) = (0, 0)
        
        var count = 0
        
        while true {
                        
            switch d {
                
            // 북쪽바라봄 -> 왼쪽방향은 서쪽
            case 0:
                // 현재 방향을 기준으로 왼쪽 방향 위치
                leftPos = (self.nowPos.0, self.nowPos.1 - 1)
                
                // 바라보는 공간이 있는 경우
                if (0 <= leftPos.0 && leftPos.0 < n) && (0 <= leftPos.1 && leftPos.1 < m) {
                    
                    // 바라보는 공간이 벽인 경우나 이미 청소되어있는 경우
                    if mapArr[leftPos.0][leftPos.1] == 1 || mapArr[leftPos.0][leftPos.1] == 2 {
                        // 그 방향으로 회전한다 (서쪽)
                        self.d = 3
                        backPos = (self.nowPos.0, self.nowPos.1 + 1)
                        count += 1
                    } else if mapArr[leftPos.0][leftPos.1] == 0 { // 청소하지 않은 공간이 존재하는 경우
                        mapArr[leftPos.0][leftPos.1] = 2
                        count = 0
                        self.d = 3
                        self.nowPos = leftPos
                    }
                } else {
                    self.d = 3
                }
            
            // 동쪽바라봄 -> 왼쪽 방향은 북쪽
            case 1:
                leftPos = (self.nowPos.0 - 1, self.nowPos.1)
                
                // 바라보는 공간이 있는 경우
                if (0 <= leftPos.0 && leftPos.0 < n) && (0 <= leftPos.1 && leftPos.1 < m) {
                    
                    // 바라보는 공간이 벽인 경우나 이미 청소되어있는 경우
                    if mapArr[leftPos.0][leftPos.1] == 1 || mapArr[leftPos.0][leftPos.1] == 2 {
                        // 그 방향으로 회전한다 (북쪽)
                        self.d = 0
                        backPos = (self.nowPos.0 + 1, self.nowPos.1)
                        count += 1
                    } else if mapArr[leftPos.0][leftPos.1] == 0 { // 청소하지 않은 공간이 존재하는 경우
                        mapArr[leftPos.0][leftPos.1] = 2
                        count = 0
                        self.d = 0
                        self.nowPos = leftPos
                    }
                } else {
                    self.d = 0
                }
                
            // 남쪽바라봄 -> 왼쪽 방향은 동쪽
            case 2:
                leftPos = (self.nowPos.0, self.nowPos.1 + 1)
                
                // 바라보는 공간이 있는 경우
                if (0 <= leftPos.0 && leftPos.0 < n) && (0 <= leftPos.1 && leftPos.1 < m) {
                    
                    // 바라보는 공간이 벽인 경우나 이미 청소되어있는 경우
                    if mapArr[leftPos.0][leftPos.1] == 1 || mapArr[leftPos.0][leftPos.1] == 2 {
                        // 그 방향으로 회전한다 (동쪽)
                        self.d = 1
                        backPos = (self.nowPos.0, self.nowPos.1 - 1)
                        count += 1
                    } else if mapArr[leftPos.0][leftPos.1] == 0 { // 청소하지 않은 공간이 존재하는 경우
                        mapArr[leftPos.0][leftPos.1] = 2
                        count = 0
                        self.d = 1
                        self.nowPos = leftPos
                    }
                } else {
                    self.d = 1
                }
                
            // 서쪽바라봄 -> 왼쪽 방향은 남쪽
            case 3:
                leftPos = (self.nowPos.0 + 1, self.nowPos.1)
                
                // 바라보는 공간이 있는 경우
                if (0 <= leftPos.0 && leftPos.0 < n) && (0 <= leftPos.1 && leftPos.1 < m) {
                    
                    // 바라보는 공간이 벽인 경우나 이미 청소되어있는 경우
                    if mapArr[leftPos.0][leftPos.1] == 1 || mapArr[leftPos.0][leftPos.1] == 2 {
                        // 그 방향으로 회전한다 (북쪽)
                        self.d = 2
                        backPos = (self.nowPos.0 - 1, self.nowPos.1)
                        count += 1
                    } else if mapArr[leftPos.0][leftPos.1] == 0 { // 청소하지 않은 공간이 존재하는 경우
                        mapArr[leftPos.0][leftPos.1] = 2
                        count = 0
                        self.d = 2
                        self.nowPos = leftPos
                    }
                } else {
                    self.d = 2
                }
            
            default:
                break
            }
            
            // 네 방향 모두 청소가 이미 되어있거나 벽인 경우
            if count == 4 {
                // 뒤쪽 방향이 벽이 아닌 경우 뒤로 후진
                if (0 <= backPos.0 && backPos.0 <= n) && (0 <= backPos.1 && backPos.1 <= m) {
                    
                    if mapArr[backPos.0][backPos.1] != 1 {
                        self.nowPos = backPos
                        count = 0
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]

let nextInput = readLine()!.split(separator: " ").map { Int($0)! }

let x = nextInput[0], y = nextInput[1], d = nextInput[2]

var mapArr = [[Int]]()

for _ in 1...n {
    let lastInput = Array(readLine()!.split(separator: " ").map { Int($0)! })
    
    mapArr.append(lastInput)
}

var myRobot = Robot(nowPos: (x, y), d: d)
mapArr[x][y] = 2
myRobot.clean()

var result = 0

for i in mapArr {
    for j in i {
        if j == 2 {
            result += 1
        }
    }
}

print(result)
