# www.acmicpc.net/problem/2525
# 백준 2525번 문제: 오븐 시계

a, b = map(int, input().split())
c = int(input())

if b + c >= 60:
    min = (b + c) % 60
    hour = (b + c) // 60
    
    a += hour
    
    if a == 24:
        a = 0
    elif a > 24:
        a = a % 24

else:
  min = b + c
  
print(a, min)
        
