# 백준 1158번 문제: 요세푸스(자료구조: 큐)
from collections import deque

n, k = map(int, input().split())

q = deque()
result = []
cnt = 1

for i in range(1, n + 1):
    q.append(i)

while True:
    if cnt != k:
        pop = q.popleft()
        q.append(pop)
        cnt += 1
    else:
        result.append(q.popleft())
        cnt = 1
    
    if len(q) == 0:
        break

print('<', end = '')
for i in range(0, len(result)):
  print(result[i], end = '')
  if i == len(result) - 1:
    continue
  else: 
    print(',', end = ' ')

print('>', end = '')
  
