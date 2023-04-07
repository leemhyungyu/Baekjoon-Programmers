//
//  k진수에서 소수 개수 구하기.swift
//  
//
//  Created by 임현규 on 2023/04/07.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    

    let transNum = String(n, radix: k).split(separator: "0").map { Int($0)! }
    var count = 0
    
    for i in transNum {
        if isPrime(i) {
            count += 1
        }
    }
    
    return count

}

func isPrime(_ num: Int) -> Bool {
    
    if num < 4 {
        return num == 1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
