# 백준 14621번 문제: 나만 안되는 연애
import sys
input = sys.stdin.readline

def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])
  return parent[x]

def union(parent, a, b):
  a = find_parent(parent, a)
  b = find_parent(parent, b)

  if a < b:
    parent[b] = a
  else:
    parent[a] = b

n, m = map(int, input().split())

edges = []
result = 0
count = 0
parent = [0] * (n + 1)

for i in range(1, n + 1):
  parent[i] = i

school = list(input().split())

for _ in range(m):
  a, b, cost = map(int, input().split())
  edges.append((cost, a, b, school[a-1], school[b-1]))

edges.sort()

for edge in edges:
  cost, a, b, sex1, sex2 = edge
  
  if find_parent(parent, a) != find_parent(parent, b) and sex1 != sex2:
    union(parent, a, b)
    result += cost
    count += 1

  if count == n - 1:
    break

if count != n - 1:
  print(-1)
else:
  print(result)
