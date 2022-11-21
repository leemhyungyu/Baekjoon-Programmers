# www.acmicpc.net/problem/14502
# 백준 14502번 문제: 연구소
from collections import deque

n, m = map(int, input().split())

graph = []

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]


for _ in range(n):
  graph.append(list(map(int, input().split())))

# 2와 인접한 구역을 감염시키는 함수
def infection():

  count = 0
  queue = deque()
  
  copy = [[0 for _ in range(m)] for _ in range(n)]
  
  for i in range(n):
    for j in range(m):
      copy[i][j] = graph[i][j]
      if copy[i][j] == 2:
        queue.append((i, j))  

  while queue:
    x, y = queue.popleft()

    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y
      
      if 0 <= nx < n and 0 <= ny < m:
        if copy[nx][ny] == 0:
          copy[nx][ny] = 2
          queue.append((nx, ny))

  # 0인 값을 찾아서 count해줌
  for i in copy:
    for j in i:
      if j == 0:
        count += 1
        
  return count

result = []

def wall(cnt):
  if cnt == 3:
    result.append(infection())
    return
    
  for i in range(n):
    for j in range(m):
      if graph[i][j] == 0:
        graph[i][j] = 1
        wall(cnt + 1)
        graph[i][j] = 0
        
wall(0)
print(max(result))

        
