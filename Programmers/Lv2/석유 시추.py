from collections import deque

dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]

def solution(land):
    n = len(land)
    m = len(land[0])
    visited = [[False for _ in range(m)] for  _ in range(n)]
    result = [0 for _ in range(m)]
    answer = 0
    
    def bfs(start):
        count = 0
        queue = deque([start])
        min_y, max_y = start[1], start[1]
        
        visited[start[0]][start[1]] = True
        while queue:
            x, y = queue.popleft()
            min_y = min(min_y, y)
            max_y = max(max_y, y)
            
            count += 1                
            for i in dxdy:
                nx = i[0] + x
                ny = i[1] + y
                
                if 0 <= nx < n and 0 <= ny < m:
                    if visited[nx][ny]: continue 
                    if land[nx][ny] == 0: continue 
                    queue.append((nx, ny))
                    visited[nx][ny] = True
        
        for i in range(min_y, max_y + 1):
            result[i] += count
        return count

    for y in range(m):
        for x in range(n):
            if visited[x][y] or land[x][y] == 0: continue
            bfs((x, y))
        
    answer = max(result)

            
    return answer
