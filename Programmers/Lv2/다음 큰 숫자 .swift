//
//  다음 큰 숫자 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer = n
    var binaryCode = String(n, radix: 2)
    var oneCount = binaryCode.filter { $0 == "1" }.count

    while true {
        answer += 1
        
        var findBinaryCode = String(answer, radix: 2)
        
        if findBinaryCode.filter { $0 == "1"}.count == oneCount {
            break
        }
    }
    
    return answer
}
