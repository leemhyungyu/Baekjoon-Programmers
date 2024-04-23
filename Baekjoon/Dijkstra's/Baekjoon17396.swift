//
//  Baekjoon17396.swift
//  Solved
//
//  Created by 임현규 on 2024/04/23.
//

import Foundation

struct Heap<T:Comparable> {
    var list = [T]()
    var comparer : (T,T)->Bool
    init(_ comparer : @escaping (T,T)->Bool) {
        self.comparer = comparer
    }
    
    mutating func insert(_ x : T) {
        var idx = list.count
        list.append(x)
        while idx > 0 , comparer(list[(idx-1)/2],list[idx]) {
            list.swapAt((idx-1)/2, idx)
            idx = (idx-1)/2
        }
    }
    mutating func delete() -> T? {
        if list.isEmpty { return nil }
        list.swapAt(0, list.count-1)
        let willDelete = list.removeLast()
        var idx = 0 , change = -1
        while idx < list.count {
            for k in idx*2+1...idx*2+2 {
                if k < list.count && comparer(list[idx],list[k]) {
                    if change == -1 || comparer(list[change],list[k]) {
                        change = k
                    }
                }
            }
            if change == -1 {break}
            list.swapAt(idx, change)
            idx = change
            change = -1
        }
        return willDelete
    }
    var isEmpty : Bool { return list.isEmpty}
}


struct Node : Comparable{
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.time < rhs.time
    }
    
    var n : Int
    var time : Int
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let isFind = readLine()!.split(separator: " ").map { Int($0)! }
var array = [[Int]]()

for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func solution(_ array: [[Int]], _ isFind: [Int], _ n: Int, _ m: Int) -> Int {
    var times = Array(repeating: [(Int, Int)](), count: n)
    
    for i in array {
        let a = i[0], b = i[1], time = i[2]
        times[a] += [(b, time)]
        times[b] += [(a, time)]
    }
    
    let result = dijkstra(0, &times)
    
    return result[n - 1] == Int.max ? -1 : result[n - 1]
}

func dijkstra(_ start: Int, _ times: inout [[(Int, Int)]]) -> [Int] {
    var queue =  Heap<Node>(>)
    queue.insert(Node(n: start, time: 0))
    var costs = Array(repeating: Int.max, count: n)
    costs[start] = 0
    while !queue.isEmpty {
        let now = queue.delete()!
        let node = now.n, time = now.time
        
        if time > costs[node] { continue }
        
        for next in times[node] {
            let nextNode = next.0, nextTime = next.1
            let newCost = time + nextTime
            if isFind[nextNode] == 1 && nextNode < n - 1 { continue }
            if newCost < costs[nextNode] {
                costs[nextNode] = newCost
                queue.insert(Node(n: nextNode, time: newCost))
            }
        }
    }
    
    return costs
}

print(solution(array, isFind, n, m))



