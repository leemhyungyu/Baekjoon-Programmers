//
//  Baekjoon1213.swift
//  
//
//  Created by 임현규 on 2022/12/23.
//

import Foundation

var input = Array(readLine()!.map { String($0) })
var dic = [String: Int]()
var result = [String]()
var midString = ""

for i in input {
    if let value = dic[i] {
        dic[i]! = value + 1
    } else {
        dic[i] = 1
    }
}


if dic.filter { $0.value % 2 == 1 }.count > 1 {
    print("I'm Sorry Hansoo")
    exit(0)
} else {
    for i in dic.sorted { $0.key < $1.key } {
        while dic[i.key]! > 0 {
            
            if dic[i.key]! == 1 {
                midString = i.key
                break
            }
            
            result.append(i.key)
            dic[i.key]! -= 2
        }
    }
    for i in result.reversed() {
        result.append(i)
    }

    result.insert(midString, at: (result.count) / 2)

    for i in result {
        print(i, terminator: "")
    }
}


