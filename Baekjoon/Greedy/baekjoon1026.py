# www.acmicpc.net/problem/1026
# 백준 1026번 문제: 보물

n = int(input())

a = list(map(int, input().split()))
b = list(map(int, input().split()))

result = 0

a.sort()
b.sort(reverse = True)

for i in range(n):
  result += a[i] * b[i]

print(result)
