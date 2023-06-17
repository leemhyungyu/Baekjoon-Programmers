//
//  이모티콘 할인행사.swift
//  
//
//  Created by 임현규 on 2023/06/17.
//

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    // users: [[비율, 가격]]
    // emoticons: 이모티콘의 정가 1 ~ 7
    var result = [[Int]]() // [[가입자수, 판매액]]
    var emoSale = Set<[Int]>()

    var salePersentArray = [10, 20, 30, 40]

    func setEmoSale(_ persent: [Int], _ index: Int) {
        if persent.count == emoticons.count {
            emoSale.insert(persent)
            return
        }
        
        for i in 0..<salePersentArray.count {
            setEmoSale(persent + [salePersentArray[i]], i)
        }
    }
    
    for i in 0..<salePersentArray.count {
        setEmoSale([salePersentArray[i]], i)
    }
    
    for i in emoSale {
        // 각 사람마다 이모티콘 총 구입량 구하기
        var plusPerson = 0 // 이모티콘 플러스 서비스 가입자
        var totalPrice = 0 // 총 판매액
        
        for j in users {
            var buy = 0
            
            for k in 0..<i.count {
                if i[k] >= j[0] {
                    buy += saleEmoticon(emoticons[k], i[k])
                }
            }
            
            if buy >= j[1] {
                plusPerson += 1
            } else {
                totalPrice += buy
            }
        }
        
        result.append([plusPerson, totalPrice])
    }
    
    return result.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] > $1[0] }.first!
}

func saleEmoticon(_ price: Int, _ persent: Int) -> Int {
    
    return price - (price * persent / 100)
}
