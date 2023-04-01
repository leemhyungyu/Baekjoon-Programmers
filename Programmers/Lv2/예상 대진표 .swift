//
//  예상 대진표 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var totalMember = n
    var aRound = a
    var bRound = b
    var roundCount = 0
    
    while aRound != bRound {
        
        totalMember /= 2
        
        aRound = aRound % 2 == 0 ? aRound / 2 : (aRound + 1) / 2
        bRound = bRound % 2 == 0 ? bRound / 2 : (bRound + 1) / 2
        
        roundCount += 1
    }
    
    return roundCount
}
