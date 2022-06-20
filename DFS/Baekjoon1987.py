# www.acmicpc.net/problem/1987
# 백준 1987번 문제: 알파벳
import sys
input = sys.stdin.readline

n, m = map(int, input().split())

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

graph = []
route = []


for _ in range(n):
  graph.append(list(input()))

def dfs(x, y, count):
  global result
  
  result = max(result, count)
    
  for i in range(4):
    nx = x + dx[i]
    ny = y + dy[i]

    if 0 <= nx < n and 0 <= ny < m and graph[nx][ny] not in route:
      route.append(graph[nx][ny])
      dfs(nx, ny, count + 1)
      route.remove(graph[nx][ny])

result = 1
route.append(graph[0][0])
dfs(0, 0, result)
print(result)
