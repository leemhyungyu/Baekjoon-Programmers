# www.acmicpc.net/problem/15989
# 백준 15989번 문제: 이동하기

t = int(input())

d = [0 for _ in range(10001)]

d[1] = 1
d[2] = 2
d[3] = 3

for _ in range(t):
  n = int(input())
  
  for i in range(4, n + 1):
    d[i] = d[i - 1] + d[i - 2] - d[i - 3]
    if i % 3 == 0:
      d[i] += 1
  
  print(d[n])
