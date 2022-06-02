# www.acmicpc.net/problem/2407
# 백준 2407번 문제: 조합

n, m = map(int, input().split())

d = [[0 for _ in range(m + 1) ] for _ in range(n + 1)]

d[n][1] = n

account = n

for i in range(2, m + 1):
  account -= 1
  d[n][i] = d[n][i - 1] * (account) // i

print(d[n][m])
