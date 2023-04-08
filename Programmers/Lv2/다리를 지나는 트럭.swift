//
//  다리를 지나는 트럭.swift
//  
//
//  Created by 임현규 on 2023/04/09.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {

    var time = 1
    var index = 1
    var bridgeWeight = truck_weights.first!
    var stack = [(truck_weights.first!, time)] // (무게, 들어온 시간)

    if truck_weights.count == 1 {
        return time + weight
    }
    
    while !stack.isEmpty {
        time += 1
        if time - stack.first!.1 == bridge_length {
            let truck = stack.removeFirst()
            bridgeWeight -= truck.0
        }
            
        // 트럭이 다리를 건널 수 있으면
        if bridgeWeight + truck_weights[index] <= weight {
            stack.append((truck_weights[index], time))
            bridgeWeight += truck_weights[index]
                
            index += 1
            if index == truck_weights.count {
                break
            }
        }
    }
    
    return time + bridge_length
}
