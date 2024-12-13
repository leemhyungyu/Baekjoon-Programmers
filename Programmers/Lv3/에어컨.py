def solution(temperature, t1, t2, a, b, onboard):
    temperature += 10
    t1 += 10
    t2 += 10
    time = len(onboard)
    d = [[100 * 1001 for _ in range(52)] for _ in range(time)]
    d[0][temperature] = 0
    
    for i in range(1, time):
        for j in range(51):
            if onboard[i] == 1 and (j < t1 or j > t2): continue 
            if j < temperature:
                d[i][j] = min(d[i - 1][j - 1], d[i - 1][j + 1] + a, d[i - 1][j] + b)
            elif j > temperature:
                d[i][j] = min(d[i - 1][j + 1], d[i - 1][j - 1] + a, d[i - 1][j] + b)
            else:
                d[i][j] = min(d[i - 1][j], d[i - 1][j - 1], d[i - 1][j + 1])  
            
    return min(d[time - 1])
