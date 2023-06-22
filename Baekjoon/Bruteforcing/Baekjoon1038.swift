//
//  Baekjoon1038.swift
//  
//
//  Created by 임현규 on 2023/06/22.
//

import Foundation

let n = Int(readLine()!)!
var result = [Int]()

// p: 자릿수, f: 맨 앞자리 숫자, number: 만들어진 숫자
func findNumber(_ p: Int, _ f: Int, _ number: [Int]) {
    
    if p == number.count {
        result.append(number.reduce(0) { $0 * 10 + $1})
        return
    }
    
    for i in 0...9 {
        // number의 마지막 숫자가 i보다 큰 경우에만 탐색
        if number.last! <= i { continue }
        findNumber(p, f, number + [i])
    }
}

for p in 1...10 {
    for f in 0...9 {
        findNumber(p, f, [f])
    }
}

print(result.count < n + 1 ? -1 : result[n])
