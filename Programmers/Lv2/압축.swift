//
//  압축.swift
//  
//
//  Created by 임현규 on 2023/04/08.
//

func solution(_ msg:String) -> [Int] {
    
    var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var message = msg.map { String($0) }
    var result = [Int]()
    var index = 0
    var temp = ""
    var number = 0
    
    while index < message.count {
        
        temp += message[index]

        if alpha.contains(temp) {
            index += 1
            number = alpha.firstIndex(of: temp)! + 1

            if index == message.count {
                result.append(number)
            }
            
        } else {
            result.append(number)
            alpha.append(temp)
            temp = ""
        }
    }
        
    return result
}
