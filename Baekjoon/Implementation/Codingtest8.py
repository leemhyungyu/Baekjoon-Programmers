# 이코테 8번 문제: 문자열 재정렬 (구현)

s = list(input())
s.sort()
alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

string = []

number = 0

for i in s:
  if i in alpha:
    string.append(i)
  else:
    number += int(i)

for i in string:
  print(i, end = '')
print(number)
    
