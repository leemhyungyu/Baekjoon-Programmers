# www.acmicpc.net/problem/11724
# 백준 11724번 문제: 요소의 개수

import sys
sys.setrecursionlimit(10000)

def dfs(start, visited):
  visited[start] = True
  for i in graph[start]:
    if not visited[i]:
      dfs(i, visited)

n, m = map(int, sys.stdin.readline().split())
graph = [[] for _ in range(n+1)]
visited = [False] * (n+1)
count = 0

for _ in range(m):
  u, v = map(int, sys.stdin.readline().split())
  graph[u].append(v)
  graph[v].append(u)

for i in range(1, n+1):
  if not visited[i]:
    dfs(i, visited)
    count += 1

print(count)
