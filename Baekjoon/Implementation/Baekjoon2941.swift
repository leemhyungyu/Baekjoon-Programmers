//
//  Baekjoon2941.swift
//  
//
//  Created by 임현규 on 2022/10/05.
//

import Foundation

let alpha = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

let inputText = Array(readLine()!)
var result = 0

croAlpha(inputText)

func croAlpha(_ text: [Character]) {

    var startIndex = 0
    let endIndex = text.count - 1
    
    while startIndex <= endIndex {
        if startIndex + 1 <= endIndex && alpha.contains(String(text[startIndex]) + String(text[startIndex + 1])) {
            result += 1
            startIndex += 2
        } else if startIndex + 2 <= endIndex && alpha.contains(String(text[startIndex]) + String(text[startIndex + 1]) + String(text[startIndex + 2])) {
            result += 1
            startIndex += 3
        } else {
            result += 1
            startIndex += 1
        }
    }
    
    print(result)
}
