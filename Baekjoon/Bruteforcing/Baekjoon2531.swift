//
//  Baekjoon2531.swift
//  
//
//  Created by 임현규 on 2023/05/28.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], d = input[1], k = input[2], c = input[3]
var sushi = [Int]()
var result = 0

for _ in 0..<n {
   sushi.append(Int(readLine()!)!)
}

func solution(_ sushi: [Int]) -> Int {
     
    let sushi = sushi + sushi
    var sushiDic = [Int: Int]()
    var left = 0, right = k
    
    for i in 0..<k {
        sushiDic[sushi[i]] = (sushiDic[sushi[i]] ?? 0) + 1
    }
    
    while left < n {
        
        result = max(result, sushiDic.keys.contains(c) ? sushiDic.count : sushiDic.count + 1)


        if let value = sushiDic[sushi[left]] {
            if value == 1 {
                sushiDic.removeValue(forKey: sushi[left])
            } else {
                sushiDic[sushi[left]] = value - 1
            }
        } else {
            sushiDic[sushi[left]] = 1
        }

        sushiDic[sushi[right]] = (sushiDic[sushi[right]] ?? 0) + 1

        left += 1
        right += 1
    }
    
    return result
}

print(solution(sushi))
