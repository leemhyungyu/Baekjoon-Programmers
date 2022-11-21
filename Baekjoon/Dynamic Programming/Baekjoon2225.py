# 백준 2225번: 합분해(다이나믹 프로그래밍)
import sys

input = sys.stdin.readline
n, k = map(int, input().split())

#d[n][k]
d = [[0] * 201 for _ in range(201)]

for i in range(1, 201):
  d[1][i] = i
  d[i][1] = 1

for i in range(2, 201):
  for j in range(2, 201):
    d[i][j] = (d[i - 1][j] + d[i][j - 1]) % 1000000000

print(d[n][k])

