# www.acmicpc.net/problem/2096
# 백준 2096번 문제: 내려가기
n = int(input())

graph = []

maxResult, minResult = 0, 0

d = [[0, 0, 0], [0, 0, 0]]

for _ in range(n):
  graph.append(list(map(int, input().split())))

d[0][0] = graph[0][0]
d[0][1] = graph[0][1]
d[0][2] = graph[0][2]


for i in range(1, n):
  d[1][0] = max(d[0][0], d[0][1]) + graph[i][0]
  d[1][1] = max(d[0][0], d[0][1], d[0][2]) + graph[i][1]
  d[1][2] = max(d[0][1], d[0][2]) + graph[i][2]

  d[0][0] = d[1][0]
  d[0][1] = d[1][1]
  d[0][2] = d[1][2]

maxResult = max(d[0])

d[0][0] = graph[0][0]
d[0][1] = graph[0][1]
d[0][2] = graph[0][2]


for i in range(1, n):
  d[1][0] = min(d[0][0], d[0][1]) + graph[i][0]
  d[1][1] = min(d[0][0], d[0][1], d[0][2]) + graph[i][1]
  d[1][2] = min(d[0][1], d[0][2]) + graph[i][2]

  d[0][0] = d[1][0]
  d[0][1] = d[1][1]
  d[0][2] = d[1][2]

minResult = min(d[0])

print(maxResult, minResult)
