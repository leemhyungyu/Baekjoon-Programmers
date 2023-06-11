//
//  과제 진행하기.swift
//  
//
//  Created by 임현규 on 2023/06/11.
//

import Foundation

func solution(_ plans:[[String]]) -> [String] {
    
    var sortedPlans = plans.sorted { startTimeToMin($0[1]) < startTimeToMin($1[1]) }
    var stopPlans = [[String]]()
    var time = startTimeToMin(sortedPlans.first![1])
    var result = [String]()
    
    while !sortedPlans.isEmpty {
        
        let now = sortedPlans.removeFirst()
        let nextStartTime = sortedPlans.isEmpty ? Int.max : startTimeToMin(sortedPlans.first![1])
        let nowStartTime = startTimeToMin(now[1])
        
        // 현재 과제 진행중 새로운 과제 만나는 경우
        if nowStartTime + Int(now[2])! > nextStartTime {
            
            let plansTime = nextStartTime - nowStartTime
            
            stopPlans.append([now[0], now[1], String(Int(now[2])! - plansTime)])
            
        } else { // 현재 과제 완료
            result.append(now[0])
            
            time = nowStartTime + Int(now[2])! // 과제 완료한 시간
            
            if time == nextStartTime { // 새로운 과제를 바로해야되는 경우
                continue
            } else if time < nextStartTime { // 남은 여유시간동안 멈춘 과제 수행
                while !stopPlans.isEmpty {

                    var stop = stopPlans.removeLast()
                    var stopTime = Int(stop[2])!

                    // 멈춘 과제 수행 완료하는 경우
                    if time + stopTime <= nextStartTime {
                        time += stopTime
                        result.append(stop[0])
                        continue
                    }

                    // 멈춘 과제 부분적 수행
                    if time + stopTime > nextStartTime {
                        stopTime = time + stopTime - nextStartTime
                        stopPlans.append([stop[0], stop[1], String(stopTime)])
                        time = nextStartTime
                        break
                        
                    }
                }
            } else { // 새로운 과제가 없는 경우
                if stopPlans.isEmpty { continue }
                
                // 남은 멈춘 과제 결과에 추가
                while !stopPlans.isEmpty {
                    result.append(stopPlans.removeLast()[0])
                }
            
            }
        }
    }
    return result
}

// 문자열로 받은 시간 분단위로 변환
func startTimeToMin(_ time: String) -> Int {
    
    var hour = time.split(separator: ":").map { Int($0)! }[0]
    var min = time.split(separator: ":").map { Int($0)! }[1]
    
    return hour * 60 + min
}
