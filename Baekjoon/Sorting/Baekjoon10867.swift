//
//  Baekjoon10867.swift
//  
//
//  Created by 임현규 on 2022/09/30.
//

import Foundation

let n = Int(readLine()!)!
var numSet = Set<Int>()

readLine()!.split(separator: " ").map { numSet.insert(Int($0)!) }

numSet.sorted().map{ print($0, terminator: " ")}
