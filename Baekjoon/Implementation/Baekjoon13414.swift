//
//  Baekjoon13414.swift
//  
//
//  Created by 임현규 on 2023/05/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var k = input[0], l = input[1]
var studentId = [String]()

for _ in 0..<l {
    studentId.append(readLine()!)
}

func solution(_ studentId: [String]) {

    var dic = [String: Int]()
    
    for i in 0..<studentId.count {
        dic[studentId[i]] = i
    }
    
    let sortedDic = dic.sorted { $0.value < $1.value }
    
    for i in 0..<min(k, sortedDic.count) {
        print(sortedDic[i].key)
    }
    
}

solution(studentId)
