//
//  JadenCase 문자열 만들기 .swift
//  BackJoon
//
//  Created by 임현규 on 2022/11/22.
//

import Foundation

func solution(_ s:String) -> String {

    var result: [String] = s.map { String($0) }
    
    for i in 0...result.count - 1 {
        if i == 0 {
            result[i] = result[i].uppercased()
        } else if result[i - 1] == " " {
            result[i] = result[i].uppercased()
        } else {
            result[i] = result[i].lowercased()
        }
    }
    
    return result.joined()
}
