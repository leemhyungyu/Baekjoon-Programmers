# www.acmicpc.net/problem/9465
# 백준 9465번 문제: 스티커

t = int(input())

for _ in range(t):
  n = int(input())

  d = []

  for _ in range(2):
    d.append(list(map(int, input().split())))

  if n >= 2:
    d[0][1] += d[1][0]
    d[1][1] += d[0][0]
  
    for i in range(2, n):
      d[0][i] = max(d[1][i - 1], d[0][i - 2], d[1][i - 2]) + d[0][i]
      d[1][i] = max(d[0][i - 1], d[0][i - 2], d[1][i - 2]) + d[1][i]

  result = 0
  for i in d:
    for j in i:
      if j >= result:
        result = j
  print(result)
    
