//
//  소수 찾기.swift
//  
//
//  Created by 임현규 on 2023/04/10.
//

import Foundation

var result = Set<Int>()

func solution(_ numbers:String) -> Int {
    
    let number = numbers.map { Int(String($0))! }
    
    for i in 0..<number.count {
        bfs(i, number, i)
    }
    
    return result.count
}

func bfs(_ num: Int, _ graph: [Int], _ index: Int) {
    var queue = [(Int, [Int])]()
    
    queue.append((num, [index]))
    
    while !queue.isEmpty {
        
        let element = queue.removeFirst()
        var route = element.1
        
        let number = Int(route.map { String(graph[$0])}.joined())!
        
        if isPrime(number) {
            result.insert(number)
        }
        
        for i in 0..<graph.count {
            
            if !route.contains(i) {
                queue.append((graph[i], route + [i]))
            }
        }
    }
    
}

func isPrime(_ number: Int) -> Bool {
    
    if number < 4 {
        if number == 1 || number == 0 { return false }
        
        return true
    }
    
    for i in 2...Int(sqrt(Double(number))) {
        if (number % i) == 0 { return false }
    }
    
    return true
}
