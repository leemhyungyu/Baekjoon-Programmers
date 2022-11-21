# www.acmicpc.net/problem/2743
# 백준 2743번 문제: 단어 길이 재기

n = input()

for i in n:
  # 아스키 코드의 범위: 65 ~ 90 
  if i.isupper():
    if ord(i) + 13 > 90:
      temp = (ord(i) + 13) % 90 + 64
      print(chr(temp), end = "")
    else:
      print(chr(ord(i) + 13), end = "")

  # 아스키 코드의 범위: 97 ~ 122
  elif i.islower():
    if ord(i) + 13 > 122:
      temp = (ord(i) + 13) % 122 + 96
      print(chr(temp), end = "")
    else:
      print(chr(ord(i) + 13), end = "")

  else:
    print(i, end = "")
