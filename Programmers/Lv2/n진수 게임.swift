//
//  n진수 게임.swift
//  
//
//  Created by 임현규 on 2023/04/07.
//

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    // 진법 n, 미리 구할 숫자의 갯수 t, 게임에 참가하는 인원 m, 튜브의 순서 p
    
    var talk = [String]()
    var count = 0
    var number = 0
    
    while talk.count != t {
        let trans = String(number, radix: n).map { String($0).uppercased() }
        
        for i in 0..<trans.count {
            count += 1

            if (count - p) % m == 0 && talk.count < t {
                talk.append(trans[i])
                
                if talk.count == t {
                    break
                }
                
            }
        }
        
        number += 1
    }
    
    return talk.joined()
}
