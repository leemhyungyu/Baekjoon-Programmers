//
//  베스트앨범.swift
//  
//
//  Created by 임현규 on 2023/06/16.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var categoryDic = [Int: String]() // [고유번호: 장르]
    var numberDic = [Int: Int]() // [고유번호: 재생수]
    var categoryPlayDic = [String: Int]() // [카데고리: 재생수]
    var result = [Int]()
    
    for i in 0..<genres.count {
        numberDic[i] = plays[i]
        categoryDic[i] = genres[i]
        categoryPlayDic[genres[i]] = (categoryPlayDic[genres[i]] ?? 0) + plays[i]
    }
    
    var bestSongCount = categoryPlayDic.count * 2
    
    // 결과값이 categotyPlayDic의 개수 * 2이면 종료
    while result.count < bestSongCount {
        // 1. 속한 노래가 가장 많이 재생된 장르를 먼저 수록
        
        if categoryPlayDic.count == 0 { break }
        let largestCategory = categoryPlayDic.sorted { $0.value > $1.value }.first!.key
        
        categoryPlayDic[largestCategory] = nil // 선택된 카테고리 삭제
        
        // 2. 장르 내에서 많이 재생된 노래 먼저 수록
        
        // 해당 장르내에서 가장 많이 재생된 노래
        var sortedPlayDic = categoryDic.filter { $0.value == largestCategory }.sorted { numberDic[$0.key]! == numberDic[$1.key]! ? $0.key < $1.key : numberDic[$0.key]! > numberDic[$1.key]! }
        
        if sortedPlayDic.count < 2 {
            result.append(sortedPlayDic[0].key)
        } else {
            result.append(sortedPlayDic[0].key)
            result.append(sortedPlayDic[1].key)
        }
    }
    return result
}
