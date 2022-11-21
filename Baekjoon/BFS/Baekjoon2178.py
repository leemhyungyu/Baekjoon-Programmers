# www.acmicpc.net/problem/2178
# 백준 2178번 문졔: 미로 탐색
from collections import deque

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

def find_min_route(array, x, y):
  queue = deque()
  queue.append((x, y))
  
  while queue:
    x, y = queue.popleft()

    for i in range(4):
      nx = x + dx[i]
      ny = y + dy[i]
      
      if 0 <= nx < n and 0 <= ny < m:
        if array[nx][ny] == 1:
          array[nx][ny] = array[x][y] + 1
          queue.append((nx, ny))
        else:
          continue
      else:
        continue
      
  return array[n-1][m-1]
    
      
n, m = map(int, input().split())

array = []


for _ in range(n):
    array.append(list(map(int, input())))

print(find_min_route(array, 0, 0))
