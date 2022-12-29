//
//  Baekjoon5635.swift
//  
//
//  Created by 임현규 on 2022/12/29.
//

import Foundation

let n = Int(readLine()!)!
var student = [(String, Int, Int, Int)]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    student.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

var sortedStudent = student.sorted {
    $0.3 != $1.3 ? $0.3 > $1.3 : $0.2 != $1.2 ? $0.2 > $1.2 : $0.1 > $1.1
}

print(sortedStudent.first!.0)
print(sortedStudent.last!.0)
