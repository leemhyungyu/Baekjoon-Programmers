# www.acmicpc.net/problem/16928
# 백준 16928번 문제: 뱀과 사다리 게임
from collections import deque
  
n, m = map(int, input().split()) # 사다리 수 n, 뱀의 수 m

game = [0] * 101 # 게임판 정보 리스트
ladder = dict() # 사다리 정보 딕셔너리
snake = dict() # 뱀의 정보 딕셔너리
route = [False] * 101 # 방문확인용 리스트
dx = [1, 2, 3, 4, 5, 6] # 주사위 정보 리스트

for _ in range(n):
  a, b = map(int, input().split())
  ladder[a] = b

for _ in range(m):
  a, b = map(int, input().split())
  snake[a] = b
  
def bfs():
  queue = deque()
  queue.append(1)

  while queue:
    x = queue.popleft()

    for i in range(6):
      nx = x + dx[i]
      
      if 0 <= nx <= 100 and route[nx] == False:
        
        if nx in ladder.keys():
          nx = ladder[nx]
          
        if nx in snake.keys():
          nx = snake[nx]
          
        if route[nx] == False: 
          game[nx] = game[x] + 1
          route[nx] = True
          queue.append(nx)
          
bfs()
print(game[100])
    
