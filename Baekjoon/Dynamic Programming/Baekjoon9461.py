# www.acmicpc.net/problem/9461
# 백준 9461번 문제: 파도반 수열

t = int(input())

for _ in range(t):
  n = int(input())

  d = [1 for _ in range(n + 1)]

  for i in range(4, n + 1):
    d[i] = d[i - 2] + d[i - 3]

  print(d[n])
