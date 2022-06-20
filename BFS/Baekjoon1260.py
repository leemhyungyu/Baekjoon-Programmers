# www.acmicpc.net/problem/1260
# 백준 1260번 문제: DFS와 BFS
from collections import deque

n, m, v = map(int, input().split())

graph = [[0 for _ in range(n + 1)] for _ in range(n + 1)]
visited_bfs = [False for _ in range(n + 1)]
visited_dfs = [False for _ in range(n + 1)]

for _ in range(m):
  a, b = map(int, input().split())
  graph[a][b], graph[b][a] = 1, 1

def bfs(start):
  queue = deque()
  queue.append(start)

  visited_bfs[start] = True

  while queue:
    x = queue.popleft()
  
    for i in range(1, n + 1):
      if visited_bfs[i] == False and graph[i][x] == 1:
        queue.append(i)
        visited_bfs[i] = True
    
    print(x, end = " ")

def dfs(start):
  print(start, end = " ")
  
  visited_dfs[start] = True
  
  for i in range(1, n + 1):
    if visited_dfs[i] == False and graph[i][start] == 1:
      dfs(i)

dfs(v)
print()
bfs(v)
