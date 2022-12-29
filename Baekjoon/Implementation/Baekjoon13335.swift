//
//  Baekjoon13335.swift
//  
//
//  Created by 임현규 on 2022/12/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var carArray = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], w = input[1], l = input[2]
var queue = [(Int, Int)]()
var index = 1
var weigth = carArray[0]
var time = 1

queue.append((carArray[0], time))

if n != 1 {
    while !queue.isEmpty {
        
        time += 1

        if time - queue.first!.1 == w {
            weigth -= queue.first!.0
            queue.removeFirst()
        }
        
        if weigth + carArray[index] <= l {
            queue.append((carArray[index], time))
            weigth += carArray[index]
            
            index += 1
            
            if index == carArray.count {
                break
            }
        }
    }
    print(time + w)
} else {
    print(n + w)
}
