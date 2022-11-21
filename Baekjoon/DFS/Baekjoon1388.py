# www.acmicpc.net/problem/1388
# 백준 1388번 문제: 바닥 장식

n, m = map(int, input().split())

graph = []
visited = [[False for _ in range(m + 1)] for _ in range(n + 1)]
dy = [-1, 1]
dx = [-1, 1]

for _ in range(n):
  graph.append(list(input()))


def dfs1(x, y):
  visited[x][y] = True

  
  for i in range(2):
    nx = x
    ny = dy[i] + y

    if 0 <= nx < n and 0 <= ny < m:
      if visited[nx][ny] == False and graph[nx][ny] == '-':
        dfs1(nx, ny)

def dfs2(x, y):
  visited[x][y] = True

  
  for i in range(2):
    nx = x + dx[i]
    ny = y

    if 0 <= nx < n and 0 <= ny < m:
      if visited[nx][ny] == False and graph[nx][ny] == '|':
        dfs2(nx, ny)

count = 0 

for i in range(n):
  for j in range(m):
    if graph[i][j] == '-' and visited[i][j] == False:
      dfs1(i, j)
      count += 1

for i in range(n):
  for j in range(m):
    if graph[i][j] == '|' and visited[i][j] == False:
      dfs2(i, j)
      count += 1

print(count)
