 # www.acmicpc.net/problem/16946
# 백준 16946번 문제: 벽 부수고 이동하기4
from collections import deque


n, m = map(int, input().split())
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

group = {}
graph = []
index = 1

visited = [[False for _ in range(m)] for _ in range(n)]
copy = [[0 for _ in range(m)] for _ in range(n)]

for _ in range(n):
  graph.append(list(input()))

for i in range(n):
  for j in range(m):
    graph[i][j] = int(graph[i][j])

for i in range(n):
  for j in range(m):
    copy[i][j] = graph[i][j]
    
def findZeroArea(x, y):
  
  count = 1
  
  queue = deque()
  queue.append((x, y))

  visited[x][y] = True
  graph[x][y] = index
  
  while queue:
    
    x, y = queue.popleft()

    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y

      if 0 <= nx < n and 0 <= ny < m:
        if graph[nx][ny] == 0 and visited[nx][ny] == False:
          graph[nx][ny] = index
          count += 1
          visited[nx][ny] = True
          queue.append((nx, ny))
         
  return count

def move(x, y):

  used = []
  
  for i in range(4):

    nx = x + dx[i]
    ny = y + dy[i]

    if 0 <= nx < n and 0 <= ny < m:
      if visited[nx][ny] == True and graph[nx][ny] not in used:
        copy[x][y] += group[graph[nx][ny]]
        used.append(graph[nx][ny])
  
for i in range(n):
  for j in range(m):
    if graph[i][j] == 0 and visited[i][j] == False:
      count = findZeroArea(i, j)      
      group[index] = count
      index += 1

for i in range(n):
  for j in range(m):
    if copy[i][j] == 1 and visited[i][j] == False:
      move(i, j)
      

for i in copy:
  for j in i:
    if j != 0:
      print(j % 10, end = "")
    else:
      print(j, end = "")
  print()
  
