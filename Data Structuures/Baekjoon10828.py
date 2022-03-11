#백준 10828번: 스택
import sys

input = sys.stdin.readline

n = int(input())

s = []

for _ in range(n):
  c = input().split()
  
  if c[0] in "push":
    s.append(c[1])
    
  elif c[0] == "pop":
    if len(s) != 0:
      print(s.pop())
    else:
      print(-1)
      
  elif c[0] == "size":
    print(len(s))
    
  elif c[0] == "empty":
    if len(s) == 0:
      print(1)
    else:
      print(0)
      
  elif c[0] == "top":
    if len(s) != 0:
      print(s[len(s) - 1])
    else:
      print(-1)
