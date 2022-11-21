# www.acmicpc.net/problem/1107
# 백준 1107번 문제: 리모컨 (브루트포스)
import sys
input = sys.stdin.readline

n = int(input())
m = int(input())
result = abs(100 - n)

if m != 0: # 고장난게 있을 경우만 인풋을 받음
    btn = input().split()
else:
    btn = []

# 버튼을 눌러서 만들 수 있는 숫자 중 가장 근접한 숫자 + (+,-)로 이동한 경우의 수를 탐색하면서 최소값 찾음
for i in range(1000001):
    num = str(i)
    for j in range(len(num)):
      if num[j] in btn:
        break
      elif j == len(num) - 1:
        result = min(result, abs(n - int(num)) + len(num))

print(result)
