//
//  Baekjoon7511.swift
//  Solved
//
//  Created by 임현규 on 5/18/24.
//

import Foundation

let t = Int(readLine()!)!

for i in 0..<t {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var parents = Array(0..<n)
    print("Scenario \(i + 1):")

    func findParent(_ a: Int) -> Int {
        if parents[a] == a { return a }
        parents[a] = findParent(parents[a])
        return parents[a]
    }

    func union(_ a: Int, _ b: Int) {
        let a = findParent(a), b = findParent(b)
        
        if a == b { return }
        
        if a < b {
            parents[b] = a
        } else {
            parents[a] = b
        }
    }


    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let a = input[0], b = input[1]
        union(a, b)
    }
    
    let m = Int(readLine()!)!
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let a = input[0], b = input[1]
        if findParent(a) == findParent(b) {
            print(1)
        } else {
            print(0)
        }
    }
    print()
}
