def solution(m, n, puddles):
    d = [[0 for _ in range(m)] for _ in range(n)]
    answer = 0

    d[0][0] = 1

    for x in range(n):
        for y in range(m):
            if x == 0 and y == 0: continue 
            if [y + 1, x + 1] in puddles: continue
            d[x][y] = d[x - 1][y] + d[x][y - 1]

    return d[n - 1][m - 1] % 1000000007
