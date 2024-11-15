def solution(routes):
    answer = 0
    routes.sort()
    nowRange = routes[0]
    
    for i in range(1, len(routes)):
        nextRange = routes[i]
        if nowRange[0] <= nextRange[0] <= nowRange[1]:
            if nextRange[1] <= nowRange[1]:
                nowRange = [nextRange[0], nextRange[1]]
            else:
                nowRange = [nextRange[0], nowRange[1]]
        else:
            nowRange = nextRange
            answer += 1
            
    return answer + 1
