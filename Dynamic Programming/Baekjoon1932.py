# www.acmicpc.net/problem/1932
# 백준 1932번 문제: 정수 삼각형

n = int(input())

d = []

for _ in range(n):
  d.append(list(map(int, input().split())))

if n > 1:
  d[1][0] += d[0][0]
  d[1][1] += d[0][0]

for i in range(2, n):
  for j in range(len(d[i])):
    if 1 <= j < len(d[i]) - 1:
      d[i][j] = max(d[i - 1][j - 1] + d[i][j], d[i - 1][j] + d[i][j])
    elif j == 0:
      d[i][j] += d[i - 1][j]
    elif j == len(d[i]) - 1:
      d[i][j] += d[i - 1][j - 1]

print(max(d[n - 1]))
  
