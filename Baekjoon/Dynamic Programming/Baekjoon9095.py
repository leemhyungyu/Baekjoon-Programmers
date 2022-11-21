n = int(input())

array = []
d = [0] * 11

d[1] = 1
d[2] = 2
d[3] = 4

for _ in range(n):
  array.append(int(input()))

for i in range(4, max(array) + 1):
  # 점화식
  d[i] = d[i - 3] + d[i - 2] + d[i - 1]

for i in array:
  print(d[i])
