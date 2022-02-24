# 이코테 5번: 볼링공 고르기
n, m = map(int, input().split())

array = list(map(int, input().split()))

count = 0

for i in range(n - 1):
  for j in range(i + 1, n):
    if array[i] != array[j]:
      count += 1

print(count)
