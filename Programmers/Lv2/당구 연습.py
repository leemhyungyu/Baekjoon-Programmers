def solution(m, n, startX, startY, balls):
    answer = []
    
    for x, y in balls:
        result = 1000000001
        if not (startY == y and x < startX):
            result = min(result, (startX + x) ** 2 + (startY - y) ** 2) # 왼쪽
        if not (startX == x and y < startY):
            result = min(result, (x - startX) ** 2 + (startY + y) ** 2) # 아래
        if not (startY == y and x > startX):
            result = min(result, ((m - startX) + (m - x)) ** 2 + (startY - y) ** 2) # 오른쪽
        if not (startX == x and y > startY):
            result = min(result, (x - startX) ** 2 + ((n - y) + (n - startY)) ** 2) # 위쪽
        answer.append(result)

    return answer
