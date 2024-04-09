import sys
sys.setrecursionlimit(10**6)
input = sys.stdin.readline
m, n = map(int, input().split())
array = [list(map(int, input().split())) for _ in range(m)]

def solution(array, m, n):
    dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (-1, -1), (1, -1), (-1, 1)]
    result = 0

    def dfs(now):
        x, y = now[0], now[1]
        array[x][y] = 0
        for i in dxdy:
            nx, ny = x + i[0], y + i[1]
            if 0 <= nx < m and 0 <= ny < n and array[nx][ny] == 1:
                dfs((nx, ny))

    for x in range(m):
        for y in range(n):
            if array[x][y] == 1:
                dfs((x, y))
                result += 1
    
    return result

print(solution(array, m ,n))
