# www.acmicpc.net/problem/11725
# 백준 11725번: 트리의 부모 찾기
from collections import deque

n = int(input())

visited = [False for _ in range(n + 1)]
graph = [[] for _ in range(n + 1)]
result = [0 for _ in range(n + 1)]

for _ in range(n - 1):
  x, y = map(int, input().split())
  graph[x].append(y)
  graph[y].append(x)

def find_parent():
  queue = deque()
  queue.append(1)

  while queue:
    x = queue.popleft()
    
    for i in graph[x]:
      if visited[i] == False:
        queue.append(i)
        visited[i] = True
        result[i] = x
    
find_parent()

for i in range(2, n + 1):
  print(result[i])
