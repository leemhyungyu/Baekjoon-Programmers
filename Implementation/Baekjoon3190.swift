//
//  Baekjoon3190.swift
//  
//
//  Created by 임현규 on 2022/11/01.
//

import Foundation

class Snake {
    var pos = [[0, 0]]
    var direct = "R"
    var count = 0
    
    func startGame() {
        
        var gameResult: Bool = false
        

        while true {
                        
            switch self.direct {
            case "R":
                gameResult = self.moveSnake("R")
                
            case "L":
                gameResult = self.moveSnake("L")
            case "T":
                gameResult = self.moveSnake("T")
            case "B":
                gameResult = self.moveSnake("B")
                    
            default:
                break
            }
            
            if gameResult == true {
                break
            }
        }
    }
    
    func moveSnake(_ direct: String) -> Bool {
        var nextPos: [Int] = []
        
        switch direct {
        case "R":
            nextPos = [self.pos.last![0] + dxdy[0][0], self.pos.last![1] + dxdy[0][1]]
            
        case "L":
            nextPos = [self.pos.last![0] + dxdy[1][0], self.pos.last![1] + dxdy[1][1]]
            
        case "T":
            nextPos = [self.pos.last![0] + dxdy[2][0], self.pos.last![1] + dxdy[2][1]]
            
        case "B":
            nextPos = [self.pos.last![0] + dxdy[3][0], self.pos.last![1] + dxdy[3][1]]
        
        default:
            break
        }
        
        self.count += 1
        
        // 다음 이동할 위치가 벽또는 자기 자신인 경우
                
        if ((0 > nextPos[0] || nextPos[0] >= n) || (0 > nextPos[1] || nextPos[1] >= n)) || self.pos.contains(nextPos) {
            return true
        } else {
            
            // 오른쪽으로 이동
            self.pos.append(nextPos)
            
            // 만약 이동한 칸에 사과가 있다면
            if mapArr[nextPos[0]][nextPos[1]] == 1 {
                
                // 사과를 없애줌
                mapArr[nextPos[0]][nextPos[1]] = 0
            } else {
                // 그렇지않으면 꼬리가 위치한 칸을 비워줌
                self.pos.removeFirst()
            }
                        
            if directionArr.count > 0 {
                if count == directionArr[0].0 {
                    
                    self.findDirection(directionArr[0].1)
                    directionArr.removeFirst()
                }
            }
        }
        return false
    }
    
    func findDirection(_ direction: String) {
        
        switch self.direct {
        case "R":
            if direction == "L" { self.direct = "T" } else { self.direct = "B"}
        case "L":
            
            if direction == "L" { self.direct = "B" } else { self.direct = "T"}
        case "T":
            if direction == "L" { self.direct = "L" } else { self.direct = "R"}
        case "B":
            if direction == "L" { self.direct = "R" } else { self.direct = "L"}
        default:
            break
        }
    }
}

var dxdy = [[0, 1], [0, -1], [-1, 0], [1, 0]] // R, L, T, B

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var mapArr = [[Int]](repeating: Array(repeating: 0, count: n), count: n)
var directionArr = [(Int, String)]()

if k != 0 {
    for _ in 1...k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        
        mapArr[input[0] - 1][input[1] - 1] = 1
    }
}

let l = Int(readLine()!)!

for _ in 1...l {
    let input = readLine()!.split(separator: " ")
    
    directionArr.append((Int(input[0])!, String(input[1])))
}

let mySnake = Snake()

mySnake.startGame()

print(mySnake.count)
