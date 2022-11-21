# www.acmicpc.net/problem/11060
# 백준 11060번 문제: 이동하기

n = int(input())

d = [n + 1 for _ in range(n)]

graph = list(map(int, input().split()))

d[0] = 0

for i in range(n):
  for j in range(1, graph[i] + 1):
    if i + j < n:
      d[i + j] = min(d[i] + 1, d[i + j])

if d[n - 1] == n + 1:
  print(-1)
else:
  print(d[n - 1])

