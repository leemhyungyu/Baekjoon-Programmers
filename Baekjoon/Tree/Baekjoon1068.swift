//
//  Baekjoon1068.swift
//  Solved
//
//  Created by 임현규 on 2024/04/05.
//

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
let deleteNode = Int(readLine()!)!

struct Node {
    let number: Int
    let parent: Int?
    let child: [Int]
}

final class Tree {
    private var nodes = [Node]()
    
    func append(_ node: Node) {
        nodes.append(node)
    }
    
    func findNode(_ number: Int) -> Node? {
        return nodes.filter { $0.number == number }.first
    }
    
    func removeNode(_ number: Int) {
        nodes = nodes
            .filter { $0.number != number }
            .map {
                if $0.child.contains(number) {
                    let index = $0.child.firstIndex(of: number)
                    var child = $0.child
                    child.remove(at: index!)
                    return Node(number: $0.number, parent: $0.parent, child: child)
                } else {
                    return $0
                }
            }
    }
    
    func deleteNode(_ number: Int) {
        
        guard let targetNode = findNode(number) else { return }
        
        removeNode(number)
        
        for i in targetNode.child {
            deleteNode(i)
        }
    }
    
    func numberOfLeafNode() -> Int {
        return nodes.filter { $0.child.isEmpty }.count
    }
}


func solution(_ array: [Int], _ n: Int, _ deleteNode: Int) -> Int {
    let tree = Tree()
    
    for i in 0..<array.count {
        let child = array.enumerated().filter { $0.element == i }.map { $0.offset }
        if array[i] == -1 {
            tree.append(Node(number: i, parent: nil, child: child))
        } else {
            tree.append(Node(number: i, parent: array[i], child: child))
        }
    }
    
    
    tree.deleteNode(deleteNode)
    
    return tree.numberOfLeafNode()
}

print(solution(array, n, deleteNode))
