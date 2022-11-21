# www.acmicpc.net/problem/13539
# 백준 13539번 문제: 숨바꼭질3
from collections import deque

x, k = map(int, input().split())
graph = [0 for _ in range(100001)]
route = [False for _ in range(100001)]

graph[x] = 1

def bfs(x):
  queue = deque()
  queue.append(x)

  while queue:
    x = queue.popleft()
    dx = [x * 2, x - 1, x + 1]
    
    for i in range(3):
      # 걷는 경우
      if 0 <= dx[i] < 100001 and route[dx[i]] == False and i > 0:
        graph[dx[i]] = graph[x] + 1
        route[dx[i]] = True
        queue.append(dx[i])
      # 순간이동을 하는 경우
      elif 0 <= dx[i] < 100001 and route[dx[i]] == False and i == 0:
        graph[dx[i]] = graph[x]
        route[dx[i]] = True
        queue.append(dx[i])
        continue

    if graph[k] != 0:
      return print(graph[k] - 1)

bfs(x)
