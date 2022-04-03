# 백준 2309번: 일곱 난쟁이 (브루트포스)

result = []
height = 0

for i in range(9):
  result.append(int(input()))

for i in result:
  height += i

height = height - 100

for i in range(9):
  for j in range(i + 1, 9):
    print(i, j)
    if result[i] + result[j] == height:
      removeValue = result[j]
      result.remove(result[i])
      result.remove(removeValue)
      print(result)
      break
  if len(result) == 7:
    break

result.sort()

for i in result:
  print(i)
