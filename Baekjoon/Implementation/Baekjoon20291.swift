//
//  Baekjoon20291.swift
//  
//
//  Created by 임현규 on 2023/06/02.
//

import Foundation

let n = Int(readLine()!)!
var files = [[String]]()
var extensionDic = [String: Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: ".").map { String($0) }
    
    extensionDic[input[1]] = (extensionDic[input[1]] ?? 0) + 1
}

func solution() {
    extensionDic.sorted { $0.key < $1.key }.forEach {
        print($0.key, $0.value)
    }
}

solution()
