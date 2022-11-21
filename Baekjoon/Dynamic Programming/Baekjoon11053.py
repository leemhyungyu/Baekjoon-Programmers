# 백준 11053번 문제: 가장 긴 증가하는 부분 수열(다이나믹 프로그래밍)

n = int(input())

array = list(map(int, input().split()))

d = [0] * (n + 1)

for i in range(n):
  for j in range(i):
    if array[j] < array[i] and d[i] < d[j]:
      d[i] = d[j]
  d[i] += 1

print(max(d))
