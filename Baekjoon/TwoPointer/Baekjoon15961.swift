//
//  Baekjoon15961.swift
//  Solved
//
//  Created by 임현규 on 5/22/24.
//

import Foundation

let file = FileIO()
let (n, d, k, c) = (file.readInt(), file.readInt(), file.readInt(), file.readInt())
var array = [Int]()

for _ in 0..<n {
    array.append(file.readInt())
}

func solution(_ array: [Int], _ n: Int, _ d: Int, _ k: Int, _ c: Int) -> Int {
    let array = array + array
    var check = Array(repeating: 0, count: d + 1)
    var result = 0, left = 0, count = 0
        
    for right in 0..<n + k - 1 {
        check[array[right]] += 1
        
        if check[array[right]] == 1 {
            count += 1
        }
        
        if right - left + 1 > k {
            if check[array[left]] == 1 {
                count -= 1
            }
            check[array[left]] -= 1
            left += 1
        }
        
        result = check[c] == 0 ? max(count + 1, result) : max(count, result)
    }
    
    return result
}

print(solution(array, n, d, k, c))
