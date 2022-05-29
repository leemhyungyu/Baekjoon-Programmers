# www.acmicpc.net/problem/2156
# 백준 2156번 문제: 포도주 시식

n = int(input())

d = [[0 for _ in range(3)] for _ in range(n + 1)]


for i in range(1, n + 1):
  x = int(input())
  d[i][1] = x
  d[i][2] = x

if n > 1:
  d[2][2] += d[1][1]
  if n > 2:
    d[3][1] += d[1][1]
    d[3][2] += d[2][1]

for i in range(4, n + 1):
  d[i][1] = max(d[i - 2][1] + d[i][1], d[i - 2][2] + d[i][1], d[i - 3][1] + d[i][1], d[i - 3][2] + d[i][1])
  d[i][2] += d[i - 1][1]

result = 0

for i in d:
  for j in i:
    if j >= result:
      result = j

print(result)
