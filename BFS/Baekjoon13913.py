# www.acmicpc.net/problem/13913
# 백준 13913번 문제: 숨바꼭질
from collections import deque
import sys
sys.setrecursionlimit(10**6)

x, k = map(int, input().split())
graph = [0 for _ in range(100001)]
route = [0for _ in range(100001)]
result = []
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
        route[dx[i]] = x
        queue.append(dx[i])

      else:
        continue

    if graph[k] != 0:
      return print(graph[k] - 1)

def find_route(n):
  if n != x:
    temp = route[n]
    result.append(temp)
    return find_route(temp)
  else:
    return result

bfs(x)
result.append(k)
reuslt = find_route(k)

for i in range(len(result) - 1, -1, -1):
  print(result[i], end = ' ')
