# 백준 17413번 문제: 단어뒤집기2 (큐)

from collections import deque
import sys

s = list(input())

q = deque()
state = True
result = ''
stack = []

for i in s:
  if i == '<':
    while stack:
      result += stack.pop()
    q.append(i)
    state = False

  elif i == '>':
    q.append(i)
    state = True
    while q:
      result += q.popleft()

  elif i == ' ':
    if state:
      while stack:
        result += stack.pop()
      result += ' '
    else:
      q.append(i)
      while q:
        result += q.popleft()

  else:
    if state:
      stack.append(i)
    else:
      q.append(i)

while stack:
  result += stack.pop()

print(result)
