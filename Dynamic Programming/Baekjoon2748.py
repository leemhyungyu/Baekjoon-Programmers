# www.acmicpc.net/problem/2748
# 백준 2748번 문제: 피보나치 수2

n = int(input())

d = [0 for _ in range(n + 1)]

d[1] = 1

for i in range(2, n + 1):
  d[i] = d[i - 1] + d[i - 2]

print(d[n])
