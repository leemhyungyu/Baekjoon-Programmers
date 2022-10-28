//
//  Baekjoon14499.swift
//  
//
//  Created by 임현규 on 2022/10/28.
//

import Foundation

class Dice {
    
    var top: Int = 0
    var bottom: Int = 0
    var left: Int = 0
    var right: Int = 0
    var back: Int = 0
    var front: Int = 0
    
    func moveDice(bottomValue: Int, order: Int) -> Int {
        
        let nowDice = (top: self.top, bottom: self.bottom, left: self.left, right: self.right, back: self.back, front: self.front)
        
        switch order {
        
        case 1:
        /*
         1. 동쪽으로 이동
         top -> right => right = top
         bottom -> left => left = bottom
         left -> top => top = left
         right -> bottom => bottom -> right
         back -> back
         front -> front
         */
            self.top = nowDice.left
            self.right = nowDice.top
            self.left = nowDice.bottom
            self.bottom = nowDice.right
        case 2:
        /*
         2. 서쪽으로 이동
         top -> left => left = top
         bottom -> right => right = bottom
         left -> bottom => bottom = left
         right -> top => top = right
         back -> back
         front -> front
         */
            self.left = nowDice.top
            self.right = nowDice.bottom
            self.bottom = nowDice.left
            self.top = nowDice.right
            
        case 3:
        /*
         3. 북쪽으로 이동
         top -> back => back = top
         bottom -> front => front = bottom
         left -> left
         right -> right
         back -> bottom => bottom = back
         front -> top => top = front
         */
            self.back = nowDice.top
            self.front = nowDice.bottom
            self.bottom = nowDice.back
            self.top = nowDice.front
        case 4:
        /*
         4. 남쪽으로 이동
         top -> front => front = top
         bottom -> back => back = bottom
         left -> left
         right -> right
         back -> top => top = back
         front -> bottom => bottom = front
         */
            self.front = nowDice.top
            self.back = nowDice.bottom
            self.top = nowDice.back
            self.bottom = nowDice.front
        default:
            return bottomValue
        }
        
        print(top)
        
        if bottomValue == 0 {
            return self.bottom
        } else {
            self.bottom = bottomValue
            return 0
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }

var n = input[0]
var m = input[1]
var x = input[2]
var y = input[3]
var k = input[4]

var mapArr = [[Int]]()
var orderArr = [Int]()
var dicePos: (Int, Int) = (x, y)

let moveArr = [[0, 0], [0, 1], [0, -1], [-1, 0], [1, 0]] // 동, 서, 북, 남

let dice = Dice()

for _ in 1...n {
    mapArr.append(Array(readLine()!.split(separator: " ").map { Int($0)! }))
}

orderArr = readLine()!.split(separator: " ").map { Int($0)! }


for i in orderArr {
    
    // 이동할 수 있는 경우
    if (0 <= dicePos.0 + moveArr[i][0] && dicePos.0 + moveArr[i][0] < n) && (0 <= dicePos.1 + moveArr[i][1] && dicePos.1 + moveArr[i][1] < m) {
        
        dicePos.0 = dicePos.0 + moveArr[i][0]
        dicePos.1 = dicePos.1 + moveArr[i][1]
                
        mapArr[dicePos.0][dicePos.1] = dice.moveDice(bottomValue: mapArr[dicePos.0][dicePos.1], order: i)
    }
}
