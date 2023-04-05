//
//  모음사전.swift
//  
//
//  Created by 임현규 on 2023/04/06.
//

import Foundation

var count = 0
var dic = [String: Int]()

func solution(_ word:String) -> Int {
  
    dfs([])
    return dic[word]!
}

func dfs(_ word: [String]) {
    
    var words = ["A", "E", "I", "O", "U"]
    
    dic[word.joined()] = count
    
    if word.count == 5 {
        return
    }
    
    for i in words {
        count += 1
        dfs(word + [i])
    }
}
