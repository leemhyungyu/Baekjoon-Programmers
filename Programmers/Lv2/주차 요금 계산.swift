//
//  주차 요금 계산.swift
//  
//
//  Created by 임현규 on 2023/04/08.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {

    var inCar = [String: String]() // 차번호, 들어온 시간
    var total = [String: Int]() // 차번호, 누적 시간
    
    for i in records {
        var array = i.map { String($0) }
        let time = array[0...4].joined()
        let number = array[6...9].joined()
        let type = array[11...12].joined()
        
        if type == "IN" {
            inCar[number] = time
        }
        
        if type == "OU" {
            if let value = total[number] {
                total[number] = value + calTimeForInt(time) - calTimeForInt(inCar[number]!)
            } else {
                total[number] = calTimeForInt(time) - calTimeForInt(inCar[number]!)
            }
            
            inCar.removeValue(forKey: number)
        }
    }
    
    if !inCar.isEmpty {
        for i in inCar {
            if let value = total[i.key] {
                total[i.key] = value + calTimeForInt("23:59") - calTimeForInt(i.value)
            } else {
                total[i.key] = calTimeForInt("23:59") - calTimeForInt(i.value)
            }
        }
    }

    var sortedTotal = total.sorted { $0.key < $1.key }
    return sortedTotal.map {
        if $0.value - fees[0] <= 0 {
            return fees[1]
        } else {
            return fees[1] + Int(ceil(Double($0.value - fees[0]) / Double(fees[2]))) * (fees[3]) }

        }
}

// 시간을 정수로 바꿔주는 함수
func calTimeForInt(_ time: String) -> Int {
    var timeArray = time.map { String($0) }
    return Int(timeArray[0...1].joined())! * 60  + Int(timeArray[3...4].joined())!
}
