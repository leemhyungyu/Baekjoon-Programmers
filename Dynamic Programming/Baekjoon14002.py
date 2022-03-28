# 백준 14002번 문졔: 가장 긴 증가하는 부분 수열4 (다이나믹 프로그래밍)
n = int(input())

array = list(map(int, input().split()))

d = [0] * (n + 1)
result = []

for i in range(n):
  for j in range(i):
    if array[j] < array[i] and d[i] < d[j]:
      d[i] = d[j]
  d[i] += 1

print(max(d))

for i in range(1, len(d) + 1): 
 for j in range(len(d)):
   if d[j] == i and array[j] not in result:
     result.append(array[j])
     
print(*result)
