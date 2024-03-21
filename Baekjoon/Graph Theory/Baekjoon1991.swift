//
//  Baekjoon1991.swift
//  
//
//  Created by 임현규 on 2024/03/21.
//

import Foundation

struct Node {
    let left: String?
    let right: String?
}

let n = Int(readLine()!)!
var input = [[String]]()

for _ in 0..<n {
    input.append(readLine()!.split(separator: " ").map { String($0) })
}

func solution(_ nodes: [[String]]) {
    var graph = [String: Node]()

    for node in nodes {
        graph[node[0]] = Node(left: node[1] == "." ? nil : node[1], right: node[2] == "." ? nil : node[2])
    }
    
    func preorder(_ name: String?) {
        guard let name = name,
              let node = graph[name] else { return }
        
        print(name, terminator: "")
        preorder(node.left)
        preorder(node.right)
    }
    
    func inorder(_ name: String?) {
        guard let name = name,
              let node = graph[name] else { return }
        
        inorder(node.left)
        print(name, terminator: "")
        inorder(node.right)
    }
    
    func postorder(_ name: String?) {
        guard let name = name,
              let node = graph[name] else { return }
        
        postorder(node.left)
        postorder(node.right)
        print(name, terminator: "")
    }
    
    preorder("A")
    print()
    inorder("A")
    print()
    postorder("A")
}

solution(input)
