//
//  Baekjoon16987.swift
//  
//
//  Created by 임현규 on 2023/06/22.
//

import Foundation

let n = Int(readLine()!)!
var egg = [(Int, Int)]() // [(내구도, 무게)]
var result = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    egg.append((input[0], input[1]))
}

func dfs(_ eggIndex: [Int], _ brokeCount: Int) {

    if eggIndex.last! == n {
        result = max(result, brokeCount)
        return
    }
  
    // 손에 든 계란으로 깰 계란 탐색
    for i in 0..<egg.count {
        
        var leftEggIndex = eggIndex.last!
        var count = brokeCount

        // 남은 계란이 모두 깨졌거나 손에 든 계란이 깨진 경우 다음 계란 선택
        if brokeCount == n - 1 && egg[leftEggIndex].0 > 0 || egg[leftEggIndex].0 <= 0  {
            dfs(eggIndex + [leftEggIndex + 1], brokeCount)
            continue
        }
        
        // 선택한 계란이 손에 든 계란이거나 깨진 계란이면 스킵
        if i == leftEggIndex || egg[i].0 <= 0{
            continue
        }
        
        egg[i].0 -= egg[leftEggIndex].1
        egg[leftEggIndex].0 -= egg[i].1
        
        
        if egg[i].0 <= 0 { count += 1 }
        if egg[leftEggIndex].0 <= 0 { count += 1}
        
        dfs(eggIndex + [leftEggIndex + 1], count)
        egg[i].0 += egg[leftEggIndex].1
        egg[leftEggIndex].0 += egg[i].1
    }
}


dfs([0], 0)
print(result)
