# www.acmicpc.net/problem/16948
# 백준 16948번 문제: 데스 나이트
from collections import deque

dr = [-2, -2, 0, 0, 2, 2]
dc = [-1, 1, -2, 2, -1, 1]


n = int(input())
graph = [[0] * (n + 1) for _ in range(n + 1)]

r1, c1, r2, c2 = map(int, input().split())

def dps():

  q = deque()
  q.append((r1, c1))

  while q:

    r, c = q.popleft()

    for i in range(6):
      nr = r + dr[i]
      nc = c + dc[i]

      if 0 <= nr < n and 0 <= nc < n and graph[nr][nc] == 0:
        graph[nr][nc] = graph[r][c] + 1
        q.append((nr, nc))
      else:
        continue


dps()

if graph[r2][c2] == 0:
  print(-1)
else:
  print(graph[r2][c2])
    
