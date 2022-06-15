# www.acmicpc.net/problem/2638
# 백준 2638번 문제: 치즈
from collections import deque

n, m = map(int, input().split())

graph = []

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

for i in range(n):
  graph.append(list(map(int, input().split())))

def bfs(x, y):

  visited = [[False for _ in range(m + 1)] for _ in range(n + 1)]

  queue = deque()
  queue.append((x, y))

  while queue:
    x, y = queue.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if 0 <= nx < n and 0 <= ny < m:
        if graph[nx][ny] >= 1:
          graph[nx][ny] += 1
        elif graph[nx][ny] == 0 and visited[nx][ny] == False:
          visited[nx][ny] = True
          queue.append((nx, ny))


result = 0

while True:

  bfs(0, 0)
  count = 0

  for i in range(n):
    for j in range(m):
      if graph[i][j] >= 3:
        graph[i][j] = 0
        count = 1
      elif graph[i][j] == 2:
        graph[i][j] = 1

  if count == 1:
    result += 1
  else:
    break

print(result)
