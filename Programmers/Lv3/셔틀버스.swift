//
//  셔틀버스.swift
//  
//
//  Created by 임현규 on 2023/06/22.
//

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    var busTimeTable = [Int]()
    var crewTimeTable = timetable.map { timeToMin($0) }.sorted { $0 < $1 }
    var result = ""

    for n in 0..<n {
        busTimeTable.append(timeToMin("09:00") + n * t)
    }

    // 마지막 버스를 타기 위한 콘의 정류장 도착 시간을 구하는게 목적.
        while busTimeTable.count != 1 {
            let busTime = busTimeTable.removeFirst()
            
            var count = 0
            
            for i in crewTimeTable {
                if count == m { break }
                if i <= busTime {
                    count += 1
                    crewTimeTable.removeFirst()
                }
            }
        }
        
        // 버스를 탈 수 있는 사람은 m명, 남은 사람은 crueTitmeTable.count
        // m > crueTimeTable.count이면 출발 시간에 콘이 도착하면 됨
        // m <= cureTimeTable.count이면 m - 1번 순서 사람보다 -1분 빠르면 됨
        
        if m > crewTimeTable.count {
            result = minToTime(busTimeTable.last!)
        } else {
            result = minToTime(crewTimeTable[m - 1] - 1)
            
            if busTimeTable.last! < crewTimeTable[m - 1] - 1_ {
                result = minToTime(busTimeTable.last!)
            }
        }
    
    
    return result
}

/// 시간을 분으로 바꿔주는 함수 (ex: "08:00" -> 480)
func timeToMin(_ time: String) -> Int {
    let time = time.split(separator: ":").map { Int($0)! }
    
    return time[0] * 60 + time[1]
}

/// 분을 시간으로 바꿔주는 함수 (ex: 480 -> "08:00")
func minToTime(_ min: Int) -> String {
    let hour = min / 60
    let min = min % 60
    
    return (hour < 10 ? "0" + String(hour) : String(hour)) + ":" + (min < 10 ? "0" + String(min) : String(min))
}
