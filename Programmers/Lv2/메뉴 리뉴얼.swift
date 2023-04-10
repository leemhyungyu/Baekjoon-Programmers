//
//  메뉴 리뉴얼.swift
//  
//
//  Created by 임현규 on 2023/04/10.
//

import Foundation

var dic = [String: Int]()
var check = [String]()
func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    for i in orders {
        let array = i.map { String($0) }
        
       check = []

        for j in 0..<array.count - 1 {
            dfs(array, [array[j]])
        }
    }

    var result = [String]()
    
    for i in course {
        let filterDic = dic.filter { $0.key.count == i && $0.value > 1 }.sorted { $0.value > $1.value }
        
        if filterDic.isEmpty { break }

        let value = filterDic.first!.value
        
        for j in filterDic {
            if j.value != value {
                break
            } else {
                result.append(j.key)
            }
        }
    }
 
    return result.sorted { $0 < $1 }
}

func dfs(_ array: [String], _ course: [String]) {
        
    let sortedRoute = route.sorted { $0 < $1 }

    if check.contains(sortedRoute.joined()) {
        return
    }

    if let value = dic[sortedRoute.joined()] {
        dic[sortedRoute.joined()] = value + 1
    } else {
        dic[sortedRoute.joined()] = 1
    }
    
    check.append(sortedRoute.joined())
        
    for i in array {
        if !course.contains(String(i)) {
            dfs(array, route + [String(i)], count)
        }
    }
}
