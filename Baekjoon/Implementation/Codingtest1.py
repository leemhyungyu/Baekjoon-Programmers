# 이코테 1번 : 모험가 길드

n = int(input())
fear = list(map(int, input().split()))
result = 0
count = 0

fear.sort()

print(fear)

for i in fear:
  count += 1
  if count >= i:
    result += 1
    count = 0

print(result)
    
  
