# www.acmicpc.net/problem/1476
# 백준 1476번 문제: 날짜 계산 (브루트포스)

e, s, m = map(int, input().split())
result = 0
  
count_e, count_s, count_m = 0, 0, 0

while True:
  
  count_e += 1
  count_s += 1
  count_m += 1
  result += 1
  
  if count_e > 15:
    count_e = 1

  if count_s > 28:
    count_s = 1

  if count_m > 19:
    count_m = 1
  
  if count_e == e and count_s == s and count_m == m:
    break;

print(result)
