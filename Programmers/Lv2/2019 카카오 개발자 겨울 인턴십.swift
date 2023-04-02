//
//  2019 카카오 개발자 겨울 인턴십.swift
//  
//
//  Created by 임현규 on 2023/04/02.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    var numbers = s.split { !$0.isNumber }.map { Int($0)! }
    
    var dic = [Int: Int]()
    
    for number in numbers {
        if let value = dic[number] {
            dic[number] = value + 1
        } else {
            dic[number] = 1
        }
    }
            
    return dic.sorted { $0.value > $1.value }.map { $0.key }
}
