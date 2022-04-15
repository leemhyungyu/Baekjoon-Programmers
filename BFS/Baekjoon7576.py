# www.acmicpc.net/problem/7576
# 백준 7576번 문제: 토마토

from collections import deque

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

queue = deque()

def find_day():
  
  while queue:
    x, y = queue.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]
      
      if 0 <= nx < n and 0 <= ny < m:
        if array[nx][ny] == 0:
          array[nx][ny] = array[x][y] + 1
          queue.append((nx, ny))
        else:
          continue
      else:
        continue
      
  return array

m, n = map(int, input().split())
array = []
result = []

for _ in range(n):
  array.append(list(map(int, input().split())))


for i in range(n):
  for j in range(m):
    if array[i][j] == 1:
      queue.append((i, j))

find_day()
result = max(map(max, array))

for i in range(n):
  for j in range(m):
    if array[i][j] == 0:
      result = 0

print(result - 1)
      
