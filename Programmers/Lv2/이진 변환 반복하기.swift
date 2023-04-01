//
//  이진 변환 반복하기.swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    var transCount = 0
    var removeCount = 0
    var binary = s
    
    while binary != "1" {
        transCount += 1
        removeCount += binary.filter { $0 == "0" }.count
        binary = String(binary.filter { $0 == "1" }.count, radix: 2)
    }
    
    return [transCount, removeCount]
}
