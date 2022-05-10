# www.acmicpc.net/problem/23841
# 백준 23841 문제: 데칼코마니
n, m = map(int, input().split())

graph = []
visited = [[False for _ in range(m + 1)] for _ in range(n + 1)]

for _ in range(n):
  graph.append(list(input()))

def decal(x, y):
  
    graph[x][m - y - 1] = graph[x][y]
    visited[x][m - y - 1] = True

for i in range(n):
  for j in range(m):
    if graph[i][j] != '.' and visited[i][j] == False:
      decal(i, j)

for i in graph:
  for j in i:
    print(j, end = "")
  print()
  
