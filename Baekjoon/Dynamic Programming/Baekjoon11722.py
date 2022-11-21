# www.acmicpc.net/problem/11722번
# 백준 11722번 문제: 가장 긴 감소하는 부분 순열

n = int(input())

array = list(map(int, input().split()))

d = [0 for _ in range(n)]

for i in range(n):
  for j in range(i):
    if array[j] > array[i] and d[j] > d[i]:
      d[i] = d[j]
  d[i] += 1

print(max(d))
