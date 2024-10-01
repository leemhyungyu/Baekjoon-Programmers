def solution(triangle):
    n = len(triangle[-1])
    d = [[0 for _ in range(n)] for _ in range(n)]
    answer = 0
    d[0][0] = triangle[0][0]
    
    for x in range(1, n):
        for y in range(0, x + 1):
            d[x][y] = max(triangle[x][y] + d[x - 1][y], triangle[x][y] + d[x - 1][y - 1], d[x][y])
            answer = max(d[x][y], answer)

    return answer
