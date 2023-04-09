//
//  큰수 만들기.swift
//  
//
//  Created by 임현규 on 2023/04/10.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {

    var stack = [Int]()
    var count = k
    
    for i in number {
        
        while true {
            
            if stack.isEmpty {
                stack.append(Int(String(i))!)
                break
            }
            
            // k > 0이고, 스택의 마지막 값이 i보다 작으면 삭제
            
            if count > 0 {
                if stack.last! < Int(String(i))! {
                    stack.removeLast()
                    count -= 1
                } else {
                    stack.append(Int(String(i))!)
                    break
                }
                
            } else {
                stack.append(Int(String(i))!)
                break
            }
        }
    }
    
    if stack.count != number.count - k {
        return stack[0..<number.count - k].map { String($0) }.joined()
    } else {
        return stack.map { String($0) }.joined()
    }
}
