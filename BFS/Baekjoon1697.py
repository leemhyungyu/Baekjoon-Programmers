# www.acmicpc.net/problem/1697
# 백준 1697번 문제: 숨바꼭질

from collections import deque

x, k = map(int, input().split())
graph = [0 for _ in range(100001)]
  
graph[x] = 1

def bfs(x):
  queue = deque()
  queue.append(x)

  while queue:
    x = queue.popleft()
    dx = [x - 1, x + 1, x * 2]
    
    for i in range(3):
      if 0 <= dx[i] < 100001 and graph[dx[i]] == 0:
        graph[dx[i]] = graph[x] + 1
        queue.append(dx[i])

      else:
        continue

    if graph[k] != 0:
      return print(graph[k] - 1)
      
bfs(x)
