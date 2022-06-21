# www.acmicpc.net/problem/1520
# 백준 1520번 문제: 내리막 길
import sys
sys.setrecursionlimit(10**6)
input = sys.stdin.readline

n, m = map(int, input().split())

graph = []

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

d = [[-1 for _ in range(m + 1)] for _ in range(n + 1)]

for _ in range(n):
  graph.append(list(map(int, input().split())))

def dfs(x, y):
  
  if graph[x][y] == graph[n - 1][m - 1]:
    return 1

  if d[x][y] != -1:
    return d[x][y]
    
  count = 0
  
  for i in range(4):
    nx = dx[i] + x
    ny = dy[i] + y

    if 0 <= nx < n and 0 <= ny < m:
      if graph[nx][ny] < graph[x][y]:
        count += dfs(nx, ny)
        
  d[x][y] = count

  return d[x][y]
  
print(dfs(0, 0))
