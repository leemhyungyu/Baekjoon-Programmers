//
//  Baekjoon2141.swift
//  Solved
//
//  Created by 임현규 on 6/10/24.
//

//import Foundation
//
//let n = Int(readLine()!)!
//var array = [[Int]]()
//
//for _ in 0..<n {
//    array.append(readLine()!.split(separator: " ").map { Int($0)! })
//}
//
//func solution(_ array: [[Int]], _ n: Int) -> Int {
//    let array = array.sorted { $0[0] < $1[0] }
//    let mid = (array.map { $0[1] }.reduce(0) { $0 + $1 } + 1) / 2
//    var sum = 0
//    var result = 0
//    for i in array {
//        sum += i[1]
//        if sum >= mid {
//            result = i[0]
//            break
//        }
//    }
//    
//    return result
//}
//
//print(solution(array, n))
//
//
