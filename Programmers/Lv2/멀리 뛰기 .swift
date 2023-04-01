//
//  멀리 뛰기 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

func solution(_ n:Int) -> Int {

    var d = Array(repeating: 0, count: 2001)
    
    d[1] = 1
    d[2] = 2
    
    if n == 1 || n == 2 {
        return d[n]
    } else {
     
        for i in 3...n {
            d[i] = (d[i - 2] + d[i - 1]) % 1234567
        }
    
        return d[n]
    }
}
