# www.acmicpc.net/problem/1107
# 백준 14500번: 테트로미노

import sys
input = sys.stdin.readline

# 상, 하, 좌, 우
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

n, m = map(int, input().split())
graph = []
maxValue = 0
visited = [[False] * m for _ in range(n)]

for _ in range(n):
  graph.append(list(map(int, input().split())))
   
def DFS(x, y, dsum, count):
  global maxValue
    
  if count == 4:
    maxValue = max(maxValue, dsum)
    return 
      
  for i in range(4):
    nx = x + dx[i]
    ny = y + dy[i]

    if 0 <= nx < n and 0 <= ny < m and not visited[nx][ny]:
      visited[nx][ny] = True
      DFS(nx, ny, dsum + graph[nx][ny], count + 1)
      visited[nx][ny] = False

def remain(x, y):
  global maxValue

  for i in range(4):
    temp = graph[x][y]

    for k in range(3)
    
