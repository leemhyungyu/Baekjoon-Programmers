# www.acmicpc.net/problem/11048
# 백준 11048번 문제: 이동하기

n, m = map(int, input().split())

graph = []
d = [[0 for _ in range(m)] for _ in range(n)]

#하, 우, 우대각아래
dx = [1, 0, 1]
dy = [0, 1, 1]

for _ in range(n):
  graph.append(list(map(int, input().split())))

d[0][0] = graph[0][0]

for i in range(n):
  for j in range(m):
    d[i][j] = graph[i][j]


for i in range(n):
  for j in range(m):

    if i - 1 >= 0:
      if j - 1 >= 0:
        d[i][j] = max(d[i][j] + d[i - 1][j], d[i][j] + d[i][j - 1], d[i][j] + d[i - 1][j - 1])
      else:
        d[i][j] = d[i][j] + d[i - 1][j]
    elif i - 1 < 0:
      if j - 1 >= 0:
        d[i][j] = d[i][j] + d[i][j - 1]
      else:
        d[i][j] = d[i][j]

print(d[n - 1][m - 1])
