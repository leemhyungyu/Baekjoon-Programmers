# www.acmicpc.net/problem/16953
# 백준 16953번 문제: A -> B
from collections import deque

a, b = input().split()

d = [2, '1']

def bfs():
  
  queue = deque()
  queue.append((a, 0))

  while queue:
    x, cnt = queue.popleft()

    if x == b:
        return cnt
        break

    for i in range(2):
      if i == 0:
        nx = int(x) * d[i]
      elif i == 1:
        nx = x + d[i]

      if int(nx) <= int(b):
        queue.append((str(nx), cnt + 1))

    
result = bfs()

if result == None:
    print(-1)
else:
    print(result + 1)

