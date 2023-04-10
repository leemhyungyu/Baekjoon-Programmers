//
//  방금그곡.swift
//  
//
//  Created by 임현규 on 2023/04/11.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var result = [(String, Int)]()
    for i in musicinfos {
        var sepa = i.split(separator: ",").map {String($0)}
        let new = sepa[3].replacingOccurrences(of: "C#", with: "c")
                    .replacingOccurrences(of: "D#", with: "d")
                    .replacingOccurrences(of: "F#", with: "f")
                    .replacingOccurrences(of: "G#", with: "g")
                    .replacingOccurrences(of: "A#", with: "a")
        let newM = m.replacingOccurrences(of: "C#", with: "c")
                    .replacingOccurrences(of: "D#", with: "d")
                    .replacingOccurrences(of: "F#", with: "f")
                    .replacingOccurrences(of: "G#", with: "g")
                    .replacingOccurrences(of: "A#", with: "a")
        
        let totalMusic = totalMusicinfos(sepa[0], sepa[1], new)
        if totalMusic.0.contains(newM) {
            result.append((sepa[2], totalMusic.1))
        }
    }
    
    if result.isEmpty {
        return "(None)"
    }
    
    return result.sorted { $0.1 > $1.1 }.first!.0
}

func totalMusicinfos(_ start: String, _ end: String, _ music: String) -> (String, Int) {
    var startTime = start.map { String($0) }
    var endTime = end.map { String($0) }
    var defaultMusic = music.map { String($0) }
    var result = ""
    
    var min =
    (Int(endTime[0] + endTime[1])! * 60 + Int(endTime[3] + endTime[4])!) -
    (Int(startTime[0] + startTime[1])! * 60 + Int(startTime[3] + startTime[4])!)

    
    for i in 0..<min {
        result += defaultMusic[i % music.count]
    }
    

    if min < defaultMusic.count {
        return (defaultMusic[0..<min].joined(), min)
    }
     
    return (result, min)
}
