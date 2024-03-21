//
//  도넛과 막대 그래프.swift
//  
//
//  Created by 임현규 on 2024/03/21.
//

import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var startNode = 0 // 시작 노드
    var donutCount = 0 // 도넛 모양 그래프의 수
    var barCount = 0 // 막대 모양 그래프의 수
    var eightCount = 0 // 8자 모양 그래프의 수
    var maxNode = 0 // 가장 큰 노드
    var outEdgeList = [Int: [Int]]() // 해당 노드가 가리키는 노드
    var inEdgeList = [Int: [Int]]() // 해당 노드를 가리키는 노드
    
    for edge in edges {
        let start = edge[0], end = edge[1]
        outEdgeList[start] = (outEdgeList[start] ?? [] ) + [end]
        inEdgeList[end] = (inEdgeList[end] ?? []) + [start]
        if outEdgeList[end] == nil { outEdgeList[end] = [] }
        if inEdgeList[start] == nil { inEdgeList[start] = [] }
        maxNode = max(start, end, maxNode)
    }
    
    startNode = inEdgeList
        .filter { $0.value.count == 0 }
        .map { $0.key }
        .filter { (outEdgeList[$0] ?? []).count >= 2 }.first!
    
    for node in outEdgeList[startNode]! {
        inEdgeList[node]!.remove(at: inEdgeList[node]!.firstIndex(of: startNode)!)
    }
        
    for node in 1...maxNode {
        if inEdgeList[node] == nil && outEdgeList[node] == nil { continue }
        
        if inEdgeList[node]!.count == 2 && outEdgeList[node]!.count == 2 {
            eightCount += 1
        }
        
        if inEdgeList[node]!.count == 0 && outEdgeList[node]!.count <= 1 {
            barCount += 1
        }
    }
    
    return [startNode, outEdgeList[startNode]!.count - barCount - eightCount, barCount, eightCount]
}
