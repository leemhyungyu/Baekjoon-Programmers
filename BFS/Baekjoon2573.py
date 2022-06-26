# www.acmicpc.net/problem/2573
# 백준 2573번 문제: 빙산
from collections import deque

n, m = map(int, input().split())

graph = []

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

for _ in range(n):
  graph.append(list(map(int, input().split())))


def bfs(x, y):

  queue = deque()

  queue.append((x, y))

  visited[x][y] = True
  while queue:
    x, y = queue.popleft()

    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y

      if 0 <= nx < n and 0 <= ny < m:
        if graph[nx][ny] == 0 and visited[nx][ny] == False:
          graph[x][y] -= 1

          if graph[x][y] == 0:
            visited[x][y] = True

          if graph[x][y] == -1:
            graph[x][y] = 0
            visited[x][y] = True
        
        elif graph[nx][ny] != 0 and visited[nx][ny] == False:
          queue.append((nx, ny))
          visited[nx][ny] = True



count = 0

while True:
  visited = [[False for _ in range(m + 1)] for _ in range(n + 1)]
  count += 1
  result = 0
  temp = 0
  
  for i in range(n):
    for j in range(m):
      if graph[i][j] != 0 and visited[i][j] == False:
        bfs(i, j)
        result += 1
        temp = 1

  if result >= 2:
    break

  # bfs를 더이상 못하는 경우 -> 즉 전체 그래프가 0 인 경우 
  if temp != 1:
    break

if result == 0 or result == 1:
  print(0)
else:
  print(count - 1)
