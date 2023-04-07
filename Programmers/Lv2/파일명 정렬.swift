//
//  파일명 정렬.swift
//  
//
//  Created by 임현규 on 2023/04/08.
//

func solution(_ files:[String]) -> [String] {
    
    var array = [(String, Int, Int)]() // (head, number, index)
    var result = [String]()
    
    for i in 0..<files.count {
        var stringArray = files[i].split { $0.isNumber }.map { String($0) }
        var head = stringArray.removeFirst().uppercased()
        var number = Int(files[i].split { !$0.isNumber }.map { String($0) }.first!)!
        
        array.append((head, number, i))
    }
    
    var sorted = array.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }

    for i in sorted {
        result.append(files[i.2])
    }
    return result
}
