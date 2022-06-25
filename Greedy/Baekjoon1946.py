# www.acmicpc.net/problem/1946
# 백준 1946번 문제: 신입 사원
import sys

T = int(sys.stdin.readline())

for _ in range(T):
  N = int(sys.stdin.readline()) 
  s = []
  result = 1

  for _ in range(N):
    s.append(list(map(int, sys.stdin.readline().split())))

  s = sorted(s)
  check = s[0][1]

  for i in range(1, N):
    if check > s[i][1]:
      check = s[i][1]
      result += 1

  print(result)
