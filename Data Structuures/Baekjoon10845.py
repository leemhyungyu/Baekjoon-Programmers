# 백준 10845번 : 큐
from collections import deque
import sys

input = sys.stdin.readline

n = int(input())
q = deque()

for _ in range(n):
  d = list(input().split())

  if d[0] == "push":
    q.append(d[1])

  elif d[0] == "front":
    if len(q) == 0:
      print(-1)
    else:
      print(q[0])

  elif d[0] == "back":
    if len(q) == 0:
      print(-1)
    else:
      print(q[len(q) - 1])

  elif d[0] == "size":
    print(len(q))

  elif d[0] == "empty":
    if len(q) == 0:
      print(1)
    else:
      print(0)

  elif d[0] == "pop":
    if len(q) == 0:
      print(-1)
    else:
      print(q.popleft())
  
  

