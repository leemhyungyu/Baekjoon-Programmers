# 백준 3085번 문제: 사탕 게임(브루스포스)
n = int(input())

array = []

maxLength = 0

for i in range(n):
  array.append(list(input()))


def findMaxLengthForX():
  global maxLength
  
  for i in range(n):
    countLength = 1 
    for j in range(n - 1):
      if array[i][j] == array[i][j + 1]:
        countLength += 1
        maxLength = max(maxLength, countLength)
      else:
        countLength = 1

def findMaxLengthForY():
  global maxLength
  
  for i in range(n):
    countLength = 1 
    for j in range(n - 1):
      if array[j][i] == array[j + 1][i]:
        countLength += 1
        maxLength = max(maxLength, countLength)
      else:
        countLength = 1
        
for i in range(n):
  for j in range(n - 1):
    if array[i][j] != array[i][j + 1]:
      array[i][j], array[i][j + 1] = array[i][j + 1], array[i][j]
      findMaxLengthForX()
      findMaxLengthForY()
      array[i][j], array[i][j + 1] = array[i][j + 1], array[i][j]


for i in range(n):
  for j in range(n - 1):
    if array[j][i] != array[j + 1][i]:
      array[j][i], array[j + 1][i] = array[j + 1][i], array[j][i]
      findMaxLengthForX()
      findMaxLengthForY()
      array[j][i], array[j + 1][i] = array[j + 1][i], array[j][i]

print(maxLength)
