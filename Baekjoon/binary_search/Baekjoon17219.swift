//
//  Baekjoon17219.swift
//  
//
//  Created by 임현규 on 2023/03/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]

var siteDic = [String : String]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    siteDic[input[0]] = input[1]
}

for _ in 1...m {
    print(siteDic[String(readLine()!)]!)
}
