n = int(input())

d = [0] * 1000001

d[2] = 1
d[3] = 1

for i in range(4, n+1):
  # 6의 배수일 경우
  if i % 6==0:
    d[i] = min(d[i // 3] + 1, d[i // 2] + 1, d[i - 1] + 1)
  # 3의 배수일 경우
  elif i % 3 == 0:
    d[i] = min(d[i - 1] + 1, d[int(i / 3)] + 1)
  # 2의 배수일 경우
  elif i % 2 == 0:
    d[i] = min(d[i - 1] + 1, d[int(i / 2)] + 1)
  # 2, 3 둘다 나누어 떨어지지 않을 경우
  elif i % 3 != 0 and i % 2 != 0:
    d[i] = d[i - 1] + 1
    
print(d[n])
