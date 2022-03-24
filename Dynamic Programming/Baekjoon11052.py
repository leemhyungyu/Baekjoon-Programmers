# 백준 11052번 문제: 카드 구매하기(다이나믹 프로그래밍)

n = int(input())
array = list(map(int, input().split()))

d = [0 for _ in range(n + 1)]

d[1] = array[0]

for i in range(1, n + 1):
  d[i] = array[i - 1]
  for j in range(1, i):
    d[i] = max(d[i], array[(i - j) - 1] + d[j])
  

print(d[n])
