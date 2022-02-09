t = int(input())

array = []

# 0이 출력하는 횟수와, 1이 출력하는 횟수를 저장하는 배열
d = [0] * 41

d[0] = (1, 0)
d[1] = (0, 1)

for _ in range(t):
  array.append(int(input()))

for i in range(2, max(array) + 1):
  # 피보나치함수에서 0과 1이 호출되는 횟수의 점화식
  d[i] = (d[i-2][0] + d[i-1][0], d[i-2][1] + d[i-1][1])
  
for i in array:
  print(d[i][0], d[i][1])
