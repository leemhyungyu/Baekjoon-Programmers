n = int(input())

array = []
  
for _ in range(n):
  array.append(list(map(int, input().split())))

for i in range(1, len(array)):
  array[i][0] = min(array[i-1][1], array[i-1][2]) + array[i][0]
  array[i][1] = min(array[i-1][0], array[i-1][2]) + array[i][1]
  array[i][2] = min(array[i-1][0], array[i-1][1]) + array[i][2]

print(min(array[n-1][0], array[n-1][1], array[n-1][2]))
