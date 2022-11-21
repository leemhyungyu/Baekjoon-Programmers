# www.acmicpc.net/problem/7562
# 백준 7562번 문제: 나이트의 이동
from collections import deque

t = int(input())

# 나이트의 이동 방향 (북서쪽부터 반시계방향)
dx = [-2, -1, 1, 2, 2, 1, -1, -2]
dy = [-1, -2, -2, -1, 1, 2, 2, 1]

def bps(graph, x, y):
  queue = deque()
  queue.append((x, y))

  while queue:
    x, y = queue.popleft()

    for i in range(8):
      nx = x + dx[i]
      ny = y + dy[i]

      if 0 <= nx < n and 0 <= ny < n:
        if graph[nx][ny] == 0:
          graph[nx][ny] = graph[x][y] + 1
          queue.append((nx, ny))
        else:
          continue
      else:
        continue
  
for _ in range(t):

  graph = []
  
  n = int(input())

  graph = [[0] * (n) for _ in range(n)]

  now_x, now_y = map(int, input().split())
  
  graph[now_x][now_y] = 1

  dest_x, dest_y = map(int, input().split())

  bps(graph, now_x, now_y)
  
  print(graph[dest_x][dest_y] - 1)
  
