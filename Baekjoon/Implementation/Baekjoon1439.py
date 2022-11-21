# 백준 1439번 문제: 문자열 뒤집기

s = list(input())

count = 0
for i in range(len(s)-1):

  if s[i+1] != s[i]:
    count += 1
    
print((count + 1) // 2)
