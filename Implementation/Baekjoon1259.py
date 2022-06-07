# www.acmicpc.net/problem/1259
# 백준 1259번 문제: 팰린드롭수

while True:
  n = input()
  
  if n == '0':
    break
    
  result = 0
  
  for i in range(len(n) // 2):
    if n[i] == n[-(i + 1)]:
      result += 1

  if result == len(n) // 2:
    print("yes")
  else:
    print("no")
