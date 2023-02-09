//
//  Baekjoon2812.swift
//  
//
//  Created by 임현규 on 2023/02/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
var count = k
var number = readLine()!.map { Int(String($0))! }
var resultArray: [Int] = [number.removeFirst()]

if n == 1 {
    print(0)
} else {
    for i in number {
        while true {
            if count == 0 || resultArray.isEmpty || resultArray.last! >= i {
                break
            }
            
            resultArray.removeLast()
            count -= 1
            
        }
        
        resultArray.append(i)
    }
}

print(resultArray[0...n - k - 1].map { String($0) }.joined(separator: ""))
