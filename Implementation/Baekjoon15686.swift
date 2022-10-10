//
//  Baekjoon15686.swift
//  
//
//  Created by 임현규 on 2022/10/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0], m = input[1]

var store = [(Int, Int)]()
var home = [(Int, Int)]()
var result = Int.max
var choseStore = [Int]()

for i in 0...(n - 1) {
    let input2 = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0...(n - 1) {
        if input2[j] == 2 {
            store.append((i, j))
        } else if input2[j] == 1 {
            home.append((i, j))
        }
    }
}

var visited = Array(repeating: false, count: store.count + 1)

// 완전 탐색
func dfs(_ length: Int, _ start: Int) {
    
    if choseStore.count > length { return }
    
    if length == m {
        result = min(result, getDistance())
        return
    }
    
    for i in start...store.count {
        if visited[i] { continue }
        
        visited[i] = true
        choseStore.append(i)
        dfs(length + 1, i)
        visited[i] = false
        choseStore.popLast()
    }
}

// 치킨집의 개수가 m개일 때 각 집에서 최소 거리를 합한 결과를 반환하는 함수
func getDistance() -> Int {
    
    var sum = 0
    
    home.forEach { homePos in
        var temp = Int.max
        choseStore.forEach { chosedIndex in
            let storePos = store[chosedIndex - 1]
            let distance = abs(homePos.0 - storePos.0) + abs(homePos.1 - storePos.1)
            
            if distance < temp {
                temp = distance
            }
        }
        sum += temp
    }
    return sum
}

dfs(0, 1)
print(result)
