def solution(h1, m1, s1, h2, m2, s2):
    answer = 0
    startTime = h1 * 3600 + m1 * 60 + s1
    endTime = h2 * 3600 + m2 * 60 + s2
    
    if startTime == 0 or startTime == 12 * 3600:
        answer += 1
        
    while startTime < endTime:
        nextTime = startTime + 1

        currentHourAngle = startTime / 120 % 360
        currentMinAngle = startTime / 10 % 360
        currentSecAngle = startTime * 6 % 360
        
        nextHourAngle = 360 if nextTime / 120 % 360 == 0 else nextTime / 120 % 360
        nextMinAngle = 360 if nextTime / 10 % 360 == 0 else nextTime / 10 % 360
        nextSecAngle = 360 if nextTime * 6 % 360 == 0 else nextTime * 6 % 360
        
        if currentSecAngle < currentHourAngle and nextSecAngle >= nextHourAngle:
            answer += 1
            
        if currentSecAngle < currentMinAngle and nextSecAngle >= nextMinAngle:
            answer += 1
            
        if nextSecAngle == nextHourAngle and nextHourAngle == nextMinAngle:
            answer -= 1
            
        startTime += 1
        
    return answer
