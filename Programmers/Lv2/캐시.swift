//
//  캐시.swift
//  
//
//  Created by 임현규 on 2023/04/01.
//

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cache = [String]()
    var result = 0
    
    
    if cacheSize == 0 {
        result = cities.count * 5
    } else {
        for i in 0..<cities.count {
        
            let city = cities[i].lowercased()
        
          // 캐시에 존재하는 도시인 경우
            if cache.contains(city) {
                cache.remove(at: cache.firstIndex(of: city)!)
                cache.append(city)
                result += 1
            } else { // 존재 X
                if cache.count == cacheSize {
                    cache.removeFirst()
                    cache.append(city)
                } else {
                    cache.append(city)
                }
                result += 5
            }
        }
    }
     
    return result
}
