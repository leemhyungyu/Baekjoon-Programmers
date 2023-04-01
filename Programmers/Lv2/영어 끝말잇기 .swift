//
//  영어 끝말잇기 .swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var wordsArray: [String] = [words.first!]
    var failNumber = 0
    var failCount = 0
    
    for i in 1..<words.count {
        if wordsArray.contains(words[i]) || wordsArray.last!.last! != words[i].first! {
            failCount = i / n + 1
            failNumber = i % n  + 1
            break
        } else {
            wordsArray.append(words[i])
        }
    }
    return [failNumber, failCount]
}
