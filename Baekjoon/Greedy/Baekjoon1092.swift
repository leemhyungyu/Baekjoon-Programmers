//
//  Baekjoon1092.swift
//  
//
//  Created by 임현규 on 2023/02/10.
//

import Foundation

let n = Int(readLine()!)!
var craneArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 > $1 }
let m = Int(readLine()!)!
var boxArray = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 > $1 }
var count = 0

if craneArray.max()! < boxArray.max()! {
    print(-1)
} else {
    while true {
        if boxArray.count == 0 {
            break
        }
        
        for i in craneArray {
            if boxArray.count > 0 {
                for j in 0...boxArray.count - 1 {
                    if i >= boxArray[j] {
                        boxArray.remove(at: j)
                        break
                    }
                }
            }
        }
        
        count += 1
    }
    
    print(count)
}
