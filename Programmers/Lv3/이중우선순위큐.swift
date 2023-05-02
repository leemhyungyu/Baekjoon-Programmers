//
//  이중우선순위큐.swift
//  
//
//  Created by 임현규 on 2023/05/02.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var queue = [Int]()
    
    for i in operations {
        
        let command = i.split(separator: " ").map { String($0) }
        
        if i == "D -1" { // 최솟값 삭제
            if !queue.isEmpty {
                queue.sort { $0 > $1 }
                queue.removeLast()
            }

        } else if i == "D 1" { // 최댓값 삭제
            
            if !queue.isEmpty {
                queue.sort { $0 < $1 }
                queue.removeLast()
            }
        } else { // 큐에 주어진 숫자 삽입
            queue.append(Int(command[1])!)
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}
