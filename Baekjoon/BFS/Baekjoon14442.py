  # www.acmicpc.net/problem/14442
# 백준 14442 문제: 벽 부수고 이동하기2
from collections import deque
import sys
input = sys.stdin.readline

n, m, k = map(int, input().split())
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

graph = []

for _ in range(n):
  graph.append(list(input()))

for i in range(n):
  for j in range(m):
    graph[i][j] = int(graph[i][j])

def bfs():
  visited = [[[0] * (k + 1) for _ in range(m)] for _ in range(n)]
  count = [[0 for _ in range(m)] for _ in range(n)]
  queue = deque()
  queue.append((0, 0, 0))

  while queue:
    x, y, z = queue.popleft()

    if x == n - 1 and y == m - 1:
      return count[n - 1][m - 1] + 1
    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y

      if 0 <= nx < n and 0 <= ny < m:
        # 이동할 곳이 벽이고 벽을 부순횟수가 k 미만일때
        if graph[nx][ny] == 1 and z < k and visited[nx][ny][z] == 0:
          count[nx][ny] = count[x][y] + 1
          visited[nx][ny][z] = 1
          queue.append((nx, ny, z + 1))
          
        elif graph[nx][ny] == 0 and visited[nx][ny][z] == 0:
          count[nx][ny] = count[x][y] + 1
          visited[nx][ny][z] = 1
          queue.append((nx, ny, z))
          
  return -1

print(bfs())
