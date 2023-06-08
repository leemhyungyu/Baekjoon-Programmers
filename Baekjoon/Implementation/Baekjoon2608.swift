//
//  Baekjoon2608.swift
//  
//
//  Created by 임현규 on 2023/06/08.
//

import Foundation

let first = readLine()!.map { String($0) }
let second = readLine()!.map { String($0) }

var romaDic = ["I": 1, "V": 5, "X": 10, "L": 50,
            "C": 100, "D": 500, "M": 1000, "IV": 4,
            "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]

var numberDic = [1: "I", 5: "V", 10: "X", 50: "L",
            100: "C", 500: "D", 1000: "M", 4: "IV",
            9: "IX", 40: "XL", 90: "XC", 400: "CD", 900: "CM"]

func solution(_ first: [String], _ second: [String]) {
    let sumNumber = romaToNumber(first) + romaToNumber(second)
    let sumRoma = numberToRoma(sumNumber)
    
    print(sumNumber)
    print(sumRoma.joined())
}



func romaToNumber(_ roma: [String]) -> Int {
    
    var result = 0
    // 두개짜리 있는지 검사하고 없으면 1개짜리로 결과 더함
    
    var left = 0
    
    while left < roma.count {
        if left == roma.count - 1 {
            result += romaDic[roma[left]]!
            break
        }
        
        let temp = roma[left] + roma[left + 1] // 두개 짜리 검사
        
        if let value = romaDic[temp] {
            // 두개 짜리 있으면 -> 결과에 더함
            result += value
            left += 2
            
        } else {
            // 두개 짜리 없으면 -> 1개짜리 결과에 더함
            result += romaDic[roma[left]]!
            
            left += 1
        }
    }
    return result
}

func numberToRoma(_ number: Int) -> [String] {

    let number = String(number).map { String($0) }
    var result = [String]()
    
    for i in 0..<number.count {
        
        var temp = Int(number[i])! * Int(pow(10.0, Double(number.count - i - 1)))

        if let value = numberDic[temp] {
            result.append(value)
        } else {
            
            while temp > 0 {
                
                
                let targetNum = numberDic.filter { $0.key <= temp }.sorted { $0.key > $1.key }.first!.key
                
                result.append(numberDic[targetNum]!)
                temp -= targetNum

            }
        }
    }

    return result
}

solution(first, second)
