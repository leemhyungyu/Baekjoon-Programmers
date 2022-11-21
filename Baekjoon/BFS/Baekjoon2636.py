# www.acmicpc.net/problem/2636
# 백준 2636번 문제: 치즈


from collections import deque

n, m = map(int, input().split())

graph = []

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]


for _ in range(n):
  graph.append(list(map(int, input().split())))

def bfs(x, y):

  queue = deque()
  queue.append((x, y))

  visited[x][y] = True
  
  while queue:

    x, y = queue.popleft() 

    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y

      if 0 <= nx < n and 0 <= ny < m:
        if graph[nx][ny] == 1 and visited[nx][ny] == False:
          graph[nx][ny] -= 1
          visited[nx][ny] = True

        if graph[nx][ny] == 0 and visited[nx][ny] == False:
          queue.append((nx, ny))
          visited[nx][ny] = True

count = 0
result = 0

while True:
  
  visited = [[False for _ in range(m + 1)] for _ in range(n + 1)]

  temp = 0
  count += 1
  
  for i in range(n):
    for j in range(m):
      if graph[i][j] == 1:
        temp += 1
        result = temp

  bfs(0, 0)
  
  if temp == 0:
    break

print(count - 1)
print(result)
