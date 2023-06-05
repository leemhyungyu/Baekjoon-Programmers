//
//  Baekjoon17609.swift
//  
//
//  Created by 임현규 on 2023/06/05.
//

import Foundation

let t = Int(readLine()!)!
var array = [[String]]()

for _ in 0..<t {
    array.append(readLine()!.map { String($0) })
}

func solution(_ array: [[String]]) {
    
    for i in array {
        check(i, 0, i.count - 1, 0)
    }
}

func check(_ words: [String], _ left: Int, _ right: Int, _ count: Int) {
    
    if left < right {
        if words[left] == words[right] {
            check(words, left + 1, right - 1, count)
        } else {
            if count == 1 {
                return
            }
            
            if words[left + 1] == words[right] {
                check(words, left + 1, right, count + 1)
            }
            
            if words[left] == words[right - 1] {
                check(words, left, right - 1, count + 1)
            }
            
            if words[left + 1] != words[right] && words[left] != words[right - 1] {
                return
            }
        }
    } else {
        if count == 0 {
            print(0)
        } else if count == 1 {
            print(1)
        } else {
            print(2)
        }
    }
}

solution(array)
