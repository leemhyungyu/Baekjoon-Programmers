# www.acmicpc.net/problem/12886
# 백준 12886번 문제: 돌 그룹
from collections import deque
import sys
input = sys.stdin.readline

graph = list(map(int, input().split()))

result = (graph[0] + graph[1] + graph[2]) / 3
visited = [[False for _ in range(1501)] for _ in range(1501)]

dx = [-2, -1, 1, 2]


def bfs():

  queue = deque()

  queue.append(0)

  while queue:

    x = queue.popleft()

    for i in range(4):

      nx = x + dx[i]
      
      if 0 <= nx < len(graph) and visited[graph[x]][graph[nx]] == False:
        
        if graph[nx] > graph[x]:

          visited[graph[x]][graph[nx]] = True
          graph[nx] -= graph[x]
          graph[x] += graph[x]
          queue.append(nx)
 
        elif graph[nx] < graph[x]:

          visited[graph[x]][graph[nx]] = True
          graph[x] -= graph[nx]
          graph[nx] += graph[nx]
          queue.append(nx)

    if graph[0] == result and graph[1] == result and graph[2] == result:
      return 1        

if bfs() == 1:
  print(1)
else:
  print(0)
