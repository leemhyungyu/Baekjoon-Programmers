# www.acmicpc.net/problem/2579
# 백준 2579번 문제: 계단 오르기

n = int(input())
d = [[0 for _ in range(3)] for _ in range(n + 1)]

for i in range(1, n + 1):
  x = int(input())
  d[i][1] = x
  d[i][2] = x

if n >= 2:
  d[2][1] = d[2][1]
  d[2][2] += d[1][1]
  if n >= 3:
    d[3][1] += d[1][1]
    d[3][2] += d[2][1]

for i in range(4, n + 1):
  d[i][1] = max(d[i - 2][2] + d[i][1], d[i - 2][1] + d[i][1])
  d[i][2] = d[i - 1][1] + d[i][2]

print(max(d[n]))
