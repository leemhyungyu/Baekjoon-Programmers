//
//  연속 부분 수열 합의 개수.swift
//  
//
//  Created by 임현규 on 2023/04/04.
//

import Foundation

func solution(_ elements:[Int]) -> Int {

    var array = elements + elements
    var numSet = Set<Int>()

    for i in 0..<elements.count {
        var number = array[0...i].reduce(0) { $0 + $1 }
        numSet.insert(number)
        for j in 1..<elements.count {
            number = number - array[j - 1] + array[j + i]
            numSet.insert(number)
        }
    }


    return numSet.count
}
