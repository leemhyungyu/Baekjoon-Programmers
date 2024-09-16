import math

def solution(r1, r2):
    count = 0
    for x in range(1, r2 + 1):
        if r1 ** 2 - x ** 2 < 0:
            minY = 0
        else :
            minY = math.ceil(math.sqrt(r1 ** 2 - x ** 2))
            
        maxY = math.floor(math.sqrt(r2 ** 2 - x ** 2))
        count += maxY - minY + 1

    return count * 4
