//
//  가장 많이 받은 선물.swift
//  
//
//  Created by 임현규 on 2024/03/19.
//

import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var sendCountDic = [String: [String]]() // 선물을 준 친구
    var giveCountDic = [String: [String]]() // 선물을 받은 친구
    var giftIndice = [String: Int]() // 선물 지수
    var nextMonthGiftDic = [String: Int]() // 다음달에 받은 선물
    
    for gift in gifts {
        let people = gift.split(separator: " ").map { String($0) }
        let a = people[0], b = people[1]
        sendCountDic[a] = (sendCountDic[a] ?? []) + [b]
        giveCountDic[b] = (giveCountDic[b] ?? []) + [a]
    }

    for friend in friends {
        giftIndice[friend] = (sendCountDic[friend]?.count ?? 0) - (giveCountDic[friend]?.count ?? 0)
        nextMonthGiftDic[friend] = 0
    }
    
    for friend in friends {
        let sendList = sendCountDic[friend]
        let giveList = giveCountDic[friend]
        
        for i in friends {
            if i == friend { continue }
            let sendCount = sendList?.filter { $0 == i }.count ?? 0
            let giveCount = giveList?.filter { $0 == i }.count ?? 0
            
            if sendCount > giveCount {
                nextMonthGiftDic[friend] = (nextMonthGiftDic[friend] ?? 0) + 1
            } else if sendCount == giveCount || (sendCount == 0 && giveCount == 0) {
                if (giftIndice[friend] ?? 0) < (giftIndice[i] ?? 0) {
                    nextMonthGiftDic[i] = (nextMonthGiftDic[i] ?? 0) + 1
                } else if (giftIndice[friend] ?? 0) > (giftIndice[i] ?? 0) {
                    nextMonthGiftDic[friend] = (nextMonthGiftDic[friend] ?? 0) + 1
                } else {
                    continue
                }
            } else {
                nextMonthGiftDic[i] = (nextMonthGiftDic[i] ?? 0) + 1
            }
        }
    }
        
    return nextMonthGiftDic.map { $0.value / 2 }.max()!
}
