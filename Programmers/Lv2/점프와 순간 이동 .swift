//
//  점프와 순간 이동 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var ans:Int = 0
    var targetIndex = n
        
    while targetIndex != 0 {
     
        if targetIndex % 2 == 0 {
            targetIndex /= 2
        } else {
          targetIndex -= 1
           ans += 1
        }
    }
    return ans
}
