//
//  호텔 대실.swift
//  
//
//  Created by 임현규 on 2024/03/08.
//

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var rooms = [[Int]]()
    let sortedBookTime = book_time.sorted { minToStringTime($0[0]) < minToStringTime($1[0]) }
    
    for time in sortedBookTime {
        var isFlag: Bool = false
        let startTime = minToStringTime(time[0])
        let endTime = minToStringTime(time[1])

        for (index, room) in rooms.enumerated() {
            guard let currentRoomEndTime = room.last, !isFlag else { continue }
            
            if currentRoomEndTime <= startTime - 10 {
                rooms[index].append(endTime)
                isFlag.toggle()
            }
        }
        
        if !isFlag { rooms.append([endTime]) }
    }
    
    return rooms.count
}

func minToStringTime(_ time: String) -> Int {
    let time = time.split(separator: ":").map { String($0) }.map { Int($0)! }
    let hour = time[0]
    let min = time[1]
    return hour * 60 + min
}
