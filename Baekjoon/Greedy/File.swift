//
//  File.swift
//  
//
//  Created by 임현규 on 2023/02/16.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
var s = Int(readLine()!)!

for i in 0..<n {
    
    if n == 1 || s <= 0 {
        break
    }
    
    let maxValue = array[i...(i + s > n - 1 ? n - 1 : i + s)].max()!
    
    for k in i...n - 1 {
        if array[k] == maxValue {
            array.remove(at: k)
            array.insert(maxValue, at: i)
            s -= k - i
            break
        }
    }
}

print(array.map { String($0) }.joined(separator: " "))
