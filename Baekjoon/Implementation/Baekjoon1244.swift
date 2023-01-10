//
//  Baekjoon1244.swift
//  
//
//  Created by 임현규 on 2023/01/10.
//

import Foundation

let n = Int(readLine()!)!
var switchArray = readLine()!.split(separator: " ").map { Int($0)! }
let student = Int(readLine()!)!
var studentArray = [(Int, Int)]()

for _ in 1...student {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    studentArray.append((input[0], input[1]))
}

while !studentArray.isEmpty {
    
    let array = studentArray.removeFirst()
    
    let gender = array.0
    let number = array.1
    var index = [Int]()
    
    if gender == 1 {
        let baesu = Int(floor(Double(switchArray.count) / Double(number)))
        
        for i in 1...baesu {
            index.append(number * i)
        }
        
        changeSwitch(index: index)
    } else {
        
        var before = number
        var after = number
        
        while true {
            
            before -= 1
            after += 1
                        
            if (0...switchArray.count - 1).contains(before - 1) && (0...switchArray.count - 1).contains(after - 1) {
                if switchArray[before - 1] == switchArray[after - 1] {
                    index.append(before)
                    index.append(after)
                } else {
                    index.append(number)
                    changeSwitch(index: index)
                    break
                }
            } else {
                index.append(number)
                changeSwitch(index: index)
                break
            }
        }
    }
}

for i in 0...switchArray.count - 1 {
    
    print(switchArray[i], terminator: " ")
    
    if (i + 1) % 20 == 0 {
        print()
    }
}

func changeSwitch(index: [Int]) {
    for i in index {
        if switchArray[i - 1] == 0 {
            switchArray[i - 1] = 1
        } else {
            switchArray[i - 1] = 0
        }
    }
}
