//
//  카펫.swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    
    var width = 3, height = 3 // 가로, 세로

    while true {
        if width * height == brown + yellow {
            var targetBrown = height * 2 + (width - 2) * 2
            var targetYellow = (width - 2) * (height - 2)
            
            if targetBrown == brown && targetYellow == yellow {
                break
            } else {
                width = height
                height += 1
            }
        } else if width * height > brown + yellow {
            width = height
            height += 1
        } else {
            width += 1
        }
    }
    

    return [width, height] // 카페의 가로, 세로 크기
    
}
