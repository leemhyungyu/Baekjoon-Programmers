# 백준 9093번 문제: 단어 뒤집기(자료구조)
t = int(input())


for _ in range(t):
  array = list(input().split())

  for i in array:

    if len(i) == 1:
      print(i, end = '')
    else:
      for j in range(len(i) - 1, -1, -1):
        print(i[j], end = '')
    print(end = ' ')
