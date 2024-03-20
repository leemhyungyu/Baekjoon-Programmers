//
//  양과 늑대.swift
//  
//
//  Created by 임현규 on 2024/03/21.
//

import Foundation

struct Node {
    let list: [Int]
    let sheep: Int
    let wolf: Int
}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var result = 0
    var connectedNode: [[Int]] = Array(repeating: [], count: info.count)

    for i in 0..<edges.count {
        connectedNode[edges[i][0]].append(edges[i][1])
    }

    func bfs(_ node: Node) {
        var queue = [node]

        while !queue.isEmpty {
            let node = queue.removeFirst()
            let nodeList = node.list, wolf = node.wolf, sheep = node.sheep
            result = max(result, sheep)
            
            for i in nodeList {
                for j in connectedNode[i] {
                    if nodeList.contains(j) { continue }
                    if info[j] == 0 {
                        queue.append(Node(list: nodeList + [j], sheep: sheep + 1, wolf: wolf))
                    } else if sheep > wolf + 1 {
                        queue.append(Node(list: nodeList + [j], sheep: sheep, wolf: wolf + 1))
                    }
                }
            }
        }
    }

    bfs(Node(list: [0], sheep: 1, wolf: 0))

    return result
}
