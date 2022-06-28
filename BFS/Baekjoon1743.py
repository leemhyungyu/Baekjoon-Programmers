# www.acmicpc.net/problem/1743
# 백준 1743번 문제: 음식물 피하기
from collections import deque

n, m, k = map(int, input().split())

graph = [[0 for _ in range(m + 1)] for _ in range(n + 1)]

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

visited = [[False for _ in range(m + 1)] for _ in range(n + 1)]

result = []

for _ in range(k):
  x, y = map(int, input().split())
  graph[x - 1][y - 1] = 1



def bfs(x, y):
  queue = deque()
  queue.append((x, y))

  visited[x][y] = True
  
  count = 1
  
  while queue:
    x, y = queue.popleft()

    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y

      if 0 <= nx < n and 0 <= ny < m:
        if graph[nx][ny] == 1 and visited[nx][ny] == False:
          count += 1
          visited[nx][ny] = True
          queue.append((nx, ny))

  return count

for i in range(n):
  for j in range(m):
    if graph[i][j] == 1 and visited[i][j] == False:
      result.append(bfs(i, j))

print(max(result))
        
