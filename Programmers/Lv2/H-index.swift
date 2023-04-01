//
//  H-index.swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ citations:[Int]) -> Int {

    var result = 0
    for h in 0...citations.max()! {
        if citations.filter { $0 >= h }.count >= h {
           if citations.filter { $0 <= h }.count <= h {
                result = h
           }
        }
    }
    
    return result
}
