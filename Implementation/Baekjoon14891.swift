//
//  Baekjoon14891.swift
//  
//
//  Created by 임현규 on 2022/11/04.
//

import Foundation

class Gear {

    var value: [Int] = []
    
    init(_ value: [Int]) {
        self.value = value
    }
    
    func turn(_ direction: Int) {
        
        if direction == 1 {
            value.insert(value.removeLast(), at: 0)

        } else {
            value.append(value.removeFirst())
        }
    }
}

var inputGear = [[Int]]()
var number = [Int]()
var direction = [Int]()

for _ in 1...4 {
    inputGear.append(Array(readLine()!).map { Int(String($0))! })
}

var firstGear = Gear(inputGear[0])
var secondGear = Gear(inputGear[1])
var thirdGear = Gear(inputGear[2])
var fourthGear = Gear(inputGear[3])

let k = Int(readLine()!)!

for _ in 1...k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    switch input[0] - 1 {
    case 0:
        if secondGear.value[6] != firstGear.value[2] {
            if secondGear.value[2] != thirdGear.value[6] {
                if thirdGear.value[2] != fourthGear.value[6] {
                    secondGear.turn(-input[1])
                    thirdGear.turn(input[1])
                    fourthGear.turn(-input[1])
                } else {
                    secondGear.turn(-input[1])
                    thirdGear.turn(input[1])
                }
            } else {
                secondGear.turn(-input[1])
            }
        }
        firstGear.turn(input[1])
    case 1:
        if firstGear.value[2] != secondGear.value[6] {
            firstGear.turn(-input[1])
        }
        if secondGear.value[2] != thirdGear.value[6] {
            if thirdGear.value[2] != fourthGear.value[6] {
                thirdGear.turn(-input[1])
                fourthGear.turn(input[1])
            } else {
                thirdGear.turn(-input[1])
            }
        }
        secondGear.turn(input[1])
    case 2:
        if thirdGear.value[2] != fourthGear.value[6] {
            fourthGear.turn(-input[1])
        }
        if thirdGear.value[6] != secondGear.value[2] {
            if secondGear.value[6] != firstGear.value[2] {
                secondGear.turn(-input[1])
                firstGear.turn(input[1])
            } else {
                secondGear.turn(-input[1])
            }
        }
        thirdGear.turn(input[1])
    case 3:
        if fourthGear.value[6] != thirdGear.value[2] {
            if thirdGear.value[6] != secondGear.value[2] {
                if secondGear.value[6] != firstGear.value[2] {
                    thirdGear.turn(-input[1])
                    secondGear.turn(input[1])
                    firstGear.turn(-input[1])
                } else {
                    thirdGear.turn(-input[1])
                    secondGear.turn(input[1])
                }
            } else {
                thirdGear.turn(-input[1])
            }
        }
        fourthGear.turn(input[1])
    default:
        break
    }
}

var result = 0

if firstGear.value[0] == 1 {
    result += 1
}

if secondGear.value[0] == 1 {
    result += 2
}

if thirdGear.value[0] == 1 {
    result += 4
}

if fourthGear.value[0] == 1 {
    result += 8
}

print(result)
