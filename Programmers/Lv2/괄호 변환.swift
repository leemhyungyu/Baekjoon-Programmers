//
//  괄호 변환.swift
//  
//
//  Created by 임현규 on 2023/04/17.
//

import Foundation

var result = ""

func solution(_ p:String) -> String {
  
    let words = p.map { String($0) }
    separator(words)
    return result
}


func separator(_ words: [String]) {
    
    var u = [String](), v = [String]()
    
    // 빈 문자열인 경우
    if words.isEmpty { return }
    
    // 올바른 문자열인 경우
    if isGood(words.joined()) {
        result += words.joined()
        return
    }
    
    // 두개의 균형잡힌 문자열로 구분
    for i in 0..<words.count {
        
        if isBalance(words[0..<i + 1].joined()) && isBalance(words[i + 1..<words.count].joined()) {
            
            u = words[0..<i + 1].map { String($0) }
            v = words[i + 1..<words.count].map { String($0) }
            
            // u가 올바른 문자열인 경우
            if isGood(u.joined()) {
                result += u.joined()
                result += separator(v)
            }
            
            // u가 올바른 문자열이 아닌 경우
            if !isGood(u.joined()) {
                result += "("
                result += separator(v)
                result += ")"
                                
                u.removeFirst()
                u.removeLast()

                
                if !u.isEmpty {
                    for j in 0..<u.count {
                        if u[j] == "(" {
                            u[j] = ")"
                        } else {
                            u[j] = "("
                        }
                    }
                }
                
                result += u.joined()
                
                return
            }
            break
        }
    }
    return
    
}

// 균형잡힌 문자열 확인
func isBalance(_ words: String) -> Bool {
    
    var count = 0
    
    for i in words {
        if i == "(" {
            count += 1
        } else {
            count -= 1
        }
    }
    
    return count == 0 ? true : false
}

// 올바른 문자열 확인
func isGood(_ words: String) -> Bool {
    
    var stack = [String]()
    
    for i in words {
        if i == "(" {
            stack.append(String(i))
        } else {
            if stack.isEmpty { continue }
            
            stack.removeLast()
        }
    }
    
    return stack.isEmpty ? true : false
}
