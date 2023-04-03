//
//  n^2 배열 자르기.swift
//  
//
//  Created by 임현규 on 2023/04/03.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
       
    var newArray = [Int]()

    for index in left...right {
        let number = [Int(index) / n, Int(index) % n].max()! + 1
        newArray.append(number)
    }
    
    return newArray
}
