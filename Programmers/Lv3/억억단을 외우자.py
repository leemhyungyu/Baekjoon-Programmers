def solution(e, starts):
    answer = [0 for _ in range(e + 1)]
    divisor = setDivisor(e)
    maxNumber = e
    for i in range(e, 0, -1):
        if divisor[i] >= divisor[maxNumber]:
            maxNumber = i
        answer[i] = maxNumber
        
    return [answer[s] for s in starts]

def setDivisor(e):
    divisor = [0 for i in range(e + 1)]
    for i in range(2, e + 1):
        for j in range(1,min( e // i + 1, i)):
            divisor[i * j] += 2
    for i in range(1, int(e**(1 / 2)) + 1):
        divisor[i**2]+=1
    return divisor
