//
//  Baekjoon2661.swift
//  Solved
//
//  Created by 임현규 on 7/8/24.
//

import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    var result = ""
    
    func make(_ number: String) {
        if !result.isEmpty { return }

        if number.count == n {
            result = number
            return
        }
        
        
        for i in 1...3 {
            if !isAvailable(number + String(i)) { continue }
            make(number + String(i))
        }
    }
    
    func isAvailable(_ number: String) -> Bool {
        for i in 1..<(number.count / 2) + 1 {
            let a = number.map { String($0) }[number.count - i..<number.count] // 앞에 순열
            let b = number.map { String($0) }[number.count - i * 2..<number.count - i] // 뒤에 순열
            if a == b { return false }
        }
        return true
    }
    
    make("")

    return result
}

print(solution(n))
