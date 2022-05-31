# www.acmicpc.net/problem/14501
# 백준 14501번 문제: 퇴사

n = int(input())

d = [0 for _ in range(n + 1)]

value = [[0 for _ in range(2)] for _ in range(n + 1)]

for i in range(1, n + 1):
  x, y = map(int, input().split())
  d[i] = y
  
  value[i][0] = x
  value[i][1] = y

for i in range(1, n + 1):

  if value[i][0] + i > n + 1:
    value[i][1] = 0
    
  for j in range(value[i][0] + i, n + 1):
    if value[i][0] + value[j][0] < n + 1:
      value[j][1] = max(value[j][1], value[i][1] + d[j])
    else:
      value[j][1] = 0

result = 0

for i in range(len(value)):
  if value[i][1] > result:
    result = value[i][1]

print(result)
