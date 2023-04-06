//
//  스킬트리.swift
//  
//
//  Created by 임현규 on 2023/04/07.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var result = 0
    var skillOrder = skill.map { String($0) }
    
    for i in skill_trees {
        var stack = skillOrder
        var skill = i.map { String($0) }
        for j in 0..<skill.count {
            if stack.contains(skill[j]) {
                if skill[j] == stack.first! {
                stack.removeFirst()
                } else {
                    break
                }
            }

            if stack.isEmpty || j == skill.count - 1 {
                result += 1
                break
            }
        }
    }
    
    return result
}
