//
//  Baekjoon5430.swift
//  
//
//  Created by 임현규 on 2023/06/21.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let orders = readLine()!.map { String($0) }
    let numbers = Int(readLine()!)!
    var array = readLine()!.split {
        if $0.isNumber {
            return false
        } else {
            return true
        }
    }.map { Int($0)! }
    
    var left = 0
    var right = numbers
    var result = [Int]()
    var flag = false

    for i in orders {
        if i == "R" {
            flag.toggle()
            continue
        } else {
            if flag { //뒤집어져있는 상태면
                // 뒤를 삭제
                right -= 1
            } else { // 뒤집어져있지 않은 상태면
                // 앞을 삭제
                left += 1
            }
        }
    }
    
    if left > right {
        print("error")
    } else {
        result = flag ? Array(array[left..<right].reversed()) : Array(array[left..<right])
        print("[\(result.map { String($0) }.joined(separator: ","))]")
    }
}
