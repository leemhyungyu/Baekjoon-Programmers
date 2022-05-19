# www.acmicpc.net/problem/22352
# 백준 22352번 문제: 항체 인식
from collections import deque

n, m = map(int, input().split())

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

graph = []
resultGraph = []

graphVisited = [[False for _ in range(m)] for _ in range(n)]
groupVisited = [[False for _ in range(m)] for _ in range(n)]

group = [[0 for _ in range(m)] for _ in range(n)]

groupCount = 0
resultCount = 0

for _ in range(n):
  graph.append(list(map(int, input().split())))

for _ in range(n): 
  resultGraph.append(list(map(int, input().split())))

def bfs(x, y, groupCount):
  queue = deque()

  queue.append((x, y))

  graphVisited[x][y] = True
  group[x][y] = groupCount
  
  while queue:

    x, y = queue.popleft()
      
    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if 0 <= nx < n and 0 <= ny < m:
        if graph[nx][ny] == graph[x][y] and graphVisited[nx][ny] == False:
          
          visited[nx][ny] = True
          group[nx][ny] = groupCount
          queue.append((nx, ny))


def findGroup(x, y):
  queue = deque()

  queue.append((x, y))
  groupVisited[x][y] = True
  
  while queue:

    x, y = queue.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]

      if 0 <= nx < n and 0 <= ny < m:
        if graph[x][y] == graph[nx][ny] and resultGraph[x][y] != resultGraph[nx][ny]:
          return False
          
        if group[x][y] == group[nx][ny] and groupVisited[nx][ny] == False:
          groupVisited[nx][ny] = True
          
          queue.append((nx, ny))

  return True
  
for i in range(n):
  for j in range(m):
    if visited[i][j] == False:
      groupCount += 1
      bfs(i, j, groupCount)


for i in range(n):
  for j in range(m):
    if graph[i][j] != resultGraph[i][j]:
      if groupVisited[i][j] == False:
        if findGroup(i, j) == False:
          resultCount += 2
        else: 
          resultCount += 1

else:
  if resultCount == 1 or resultCount == 0:
    print("YES")
  else:
    print("NO")
      
