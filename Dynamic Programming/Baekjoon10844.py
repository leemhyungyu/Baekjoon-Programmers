# 백준 10844번 문제: 쉬운 계단 수

n = int(input())

d = [[0] * 11 for _ in range(n + 1)]
result = 0

for i in range(1, 10):
  d[1][i] = 1

for i in range(2, n + 1):
  for j in range(0, 10):
    d[i][j] = d[i - 1][j - 1] + d[i - 1][j + 1]

for i in range(10):
  result += d[n][i]

print(result % 1000000000)
    
