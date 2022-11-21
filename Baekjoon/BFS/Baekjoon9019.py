# www.acmicpc.net/problem/9019
# 백준 9019번 문제: DSLR
from collections import deque
import sys
input = sys.stdin.readline

def bfs(a):
  q = deque()
  q.append((a, ""))
  visited = [False] * (10000)

  while q:
    temp, route = q.popleft()
    visited[temp] = True
    
    if temp == b:
      print(route)
      break
      
    # 1. D함수 실행
    num = (2 * temp) % 10000
    if not visited[num]:
      q.append((num, route + "D"))
      visited[num] = True
      
    # 2. S함수 실행
    num = (temp - 1) % 10000
    if not visited[num]:
      q.append((num, route + "S"))
      visited[num] = True
      
    # 3. L함수 실행
    num = (10 * temp + (temp // 1000)) % 10000
    if not visited[num]:
      q.append((num, route + "L"))
      visited[num] = True
      
    # 4. R함수 실행
    num = (temp // 10 + (temp % 10) * 1000) % 10000
    if not visited[num]:
      q.append((num, route + "R"))
      visited[num] = True
  
for _ in range(int(input())):
  a, b = map(int, input().split())
  bfs(a)
  
