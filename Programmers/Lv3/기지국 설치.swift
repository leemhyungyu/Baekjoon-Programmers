//
//  기지국 설치.swift
//  
//
//  Created by 임현규 on 2023/04/12.
//

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var count = 0 // 설치안된 아파트의 개수
    var apartNum = 1 // 현재 아파트
    var part = Array(repeating: 0, count: stations.count)

    // 왼쪽 구역 구하고
    for i in 0..<stations.count {
        part[i] = stations[i] - w - apartNum
        apartNum = stations[i] + w + 1
    }

    // 마지막 오른쪽 구역 1개만 구하기
    if n > stations.last! + w {
        part.append(n - (stations.last! + w))
    }


    part.forEach {
        answer += Int(ceil(Double($0) / (Double(w * 2) + Double(1))))
    }

    return answer
}
