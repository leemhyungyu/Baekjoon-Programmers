from collections import deque

dxdy = [(-1, 0), (1, 0), (0, 1), (0, -1)]
visited = [[]]

def solution(maps):
    global visited
    n = len(maps[0])
    m = len(maps)
    visited = [[False for _ in range(n)] for _ in range(m)]
    return bfs(n, m, maps)

def bfs(n, m, maps):
    global visited
    queue = deque()
    queue.append((0, 0, 1))
    
    while queue:
        x, y, count = queue.popleft()
        
        if x == m - 1 and y == n - 1: return count

        for i in dxdy:
            nx = x + i[0]
            ny = y + i[1]
        
            if 0 <= nx < m and 0 <= ny < n:
                if maps[nx][ny] == 0 or visited[nx][ny] : continue 
                queue.append((nx, ny, count + 1))
                visited[nx][ny] = True
                
    return -1
