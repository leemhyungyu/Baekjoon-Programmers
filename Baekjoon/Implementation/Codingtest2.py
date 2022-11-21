# 이코테 2번 : 곱하기 혹은 더하기

array = input()
result = 0

for i in range(len(array)):
  num = int(array[i])

  if num <= 1 or result <= 1:
    result += num
  else:
    result *= num

print(result)
