# www.acmicpc.net/problem/1926
# 백준 1926번 문제: 그림
from collections import deque

n, m = map(int, input().split())

graph = []
visited = [[False for _ in range(m + 1)] for _ in range(n + 1)]

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

result = [0 for _ in range(n * m)]

for _ in range(n):
  graph.append(list(map(int, input().split())))

def bfs(x, y):
  global count
  
  queue = deque()
  queue.append((x, y))
  
  while queue:
    x, y = queue.popleft()
    result[count] += 1
    
    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y
    
      if 0 <= nx < n and 0 <= ny < m:
        if visited[nx][ny] == False and graph[nx][ny] == 1:
          visited[nx][ny] = True
          
          queue.append((nx, ny))

count = 0

for i in range(n):
  for j in range(m):
    if graph[i][j] == 1 and visited[i][j] == False:
      visited[i][j] = True
      bfs(i, j)
      count += 1

print(count)
print(max(result))
