# www.acmicpc.net/problem/2644
# 백준 2644번 문제: 촌수계산
n = int(input())

a, b = map(int, input().split())

m = int(input())

graph = [[0 for _ in range(n + 1)] for _ in range(n + 1)]
visited = [False for _ in range(n + 1)]
count = [0] * (n + 1)

for _ in range(m):
  x, y = map(int, input().split())
  graph[x][y], graph[y][x] = 1, 1

result = 0

def dfs(x):
  global result
  
  visited[x] = True
  
  for i in range(1, n + 1):
    if visited[i] == False and graph[x][i] == 1:
      count[i] = count[x] + 1
      
      if i == a:
        result = 1
        break
        
      dfs(i)

dfs(b)
if result == 1:
  print(count[a])
else:
  print(-1)
