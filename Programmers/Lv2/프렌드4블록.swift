//
//  프렌드4블록.swift
//  
//
//  Created by 임현규 on 2023/04/09.
//

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {

    var newBoard = [[String]]()
    var array = Array(repeating: Array(repeating: "", count: m), count: n)
    var result = 0
    var isSqaure = true
    
    for i in board {
        newBoard.append(i.map { String($0) })
    }
    
    for i in (0..<m) {
        for j in (0..<n) {
            array[j][i] = newBoard[i][j]
        }
    }
 
    func checkSquare(_ x: Int, _ y: Int) -> Bool {
        if array[x][y] == "" { return false }
        if array[x][y + 1] == array[x][y] && array[x + 1][y + 1] == array[x][y] && array[x + 1][y] == array[x][y] {
            return true
        } else {
            return false
        }
    }

    while isSqaure {
        var removeArray = [(Int, Int)]()

        isSqaure = false
        
        for i in 0..<n - 1 {
            for j in 0..<m - 1 {
               if checkSquare(i, j) {
                   removeArray.append((i, j))
                   isSqaure = true
                }
            }
        }

        for i in removeArray {
            var x = i.0, y = i.1
            array[x][y] = ""
            array[x + 1][y] = ""
            array[x + 1][y + 1] = ""
            array[x][y + 1] = ""
         }
        
        for i in 0..<array.count {
            let bombCount = array[i].filter { $0 == "" }.count
            
            for _ in 0..<bombCount {
                if let index = array[i].firstIndex(of: "") {
                    array[i].remove(at: index)
                }
            }
            
            for _ in 0..<bombCount {
                array[i].insert("", at: 0)
            }
        }
    }
    
    array.forEach {
        result += $0.filter { $0 == "" }.count
    }
    
    return result
}
