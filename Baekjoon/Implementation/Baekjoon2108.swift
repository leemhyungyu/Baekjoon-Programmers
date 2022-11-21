//
//  Baekjoon2108.swift
//  
//
//  Created by 임현규 on 2022/10/07.
//

import Foundation

let n = Int(readLine()!)!

var array = [Int]()

for _ in 1...n {
    array.append(Int(readLine()!)!)
}

arithmetic(array)
median(array)
modeValue(array)
rangeValue(array)

// 산술평균
func arithmetic(_ array: [Int]) {
    
    var result: Double = 0.0
    
    for i in array {
        result += Double(i)
    }
    
    result = result / Double(array.count)
    
    print(Int(round(result)))
}

// 중앙값
func median(_ array: [Int]) {
    
    var sortedArray = array.sorted()
    
    print(sortedArray[sortedArray.count / 2])
}

// 최빈값
func modeValue(_ array: [Int]) {
    
    var dic = [Int: Int]()
    
    for i in array {
        if let value = dic[i] {
            dic.updateValue(value + 1, forKey: i)
        } else {
            dic.updateValue(1, forKey: i)
        }
    }
    
    var sortedDic = dic.sorted(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 })
    
    // 같은 값이 여러개일 경우 두번째로 작은 값 출력
    
    if sortedDic.count == 1 {
        print(sortedDic[0].0)
    } else if sortedDic[0].1 == sortedDic[1].1 {
        print(sortedDic[1].0)
    } else {
        print(sortedDic[0].0)
    }
}

// 범위
func rangeValue(_ array: [Int]) {
    
    var sortedArray = array.sorted()
    
    if sortedArray.count == 1 {
        print(0)
    } else {
        print(abs(sortedArray[sortedArray.count - 1] - sortedArray[0]))
    }
}
