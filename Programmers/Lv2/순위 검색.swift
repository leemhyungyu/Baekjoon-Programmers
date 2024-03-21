//
//  순위 검색.swift
//  
//
//  Created by 임현규 on 2024/03/21.
//

import Foundation

struct People {
    let language: String
    let position: String
    let career: String
    let soulFood: String
    let score: Int
}

final class Manager {
    private var peopleArray: [People] = []
    private var dataBase = [String: [Int]]()
    
    func append(_ people: People) {
        peopleArray.append(people)
        updateDataBase(people)
    }
    
    func sortDataBase() {
        for (key, _) in dataBase {
            dataBase[key] = dataBase[key]!.sorted { $0 < $1 }
        }
    }
    
    func find(language: String,
              position: String,
              career: String,
              soulFood: String,
              score: Int) -> Int {
        let info = language + position + career + soulFood
        guard var data = dataBase[info] else { return 0 }
        let targetIndex = binarySearch(data, score)
        return data.count - targetIndex
    }
    
    private func updateDataBase(_ people: People) {
        let info = [people.language, people.position, people.career, people.soulFood]
               
        func backTraking(_ info: [String], _ count: Int, _ score: Int) {
            if count == info.count {
                dataBase[info.joined()] = (dataBase[info.joined()] ?? []) + [score]
                return
            }
            var newInfo = info
            backTraking(newInfo, count + 1, score)
            newInfo[count] = "-"
            backTraking(newInfo, count + 1, score)
        }
        backTraking(info, 0, people.score)
    }
    
    private func binarySearch(_ data: [Int], _ score: Int) -> Int {
        var start = 0, end = data.count
        while start < end {
            let mid = (start + end) / 2
            
            if data[mid] < score {
                start = mid + 1
            } else {
                end = mid
            }
        }
        return end
    }
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var result = [Int]()
    let manager = Manager()
    
    for i in info {
        let infos = i.split(separator: " ").map { String($0) }
        manager.append(People(language: infos[0], position: infos[1], career: infos[2], soulFood: infos[3], score: Int(infos[4])!))
    }
    
    manager.sortDataBase()
    
    for i in query {
        let querys = i.replacingOccurrences(of: "and", with: "").split(separator: " ").map { String($0) }
        result.append(manager.find(language: querys[0],
                    position: querys[1],
                    career: querys[2],
                    soulFood: querys[3],
                    score: Int(querys[4])!))
    }
    
    return result
}
