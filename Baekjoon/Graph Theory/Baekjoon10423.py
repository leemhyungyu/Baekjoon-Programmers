# 백준 10423번 문제: 전기가 부족해
import sys
input = sys.stdin.readline

def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])
  return parent[x]

def union(parent, a, b):
  a = find_parent(parent, a)
  b = find_parent(parent, b)

  # 두 행성 중 전력과 연결되어 있는 행성이 있다면 부모 노드를 전력원으로 만들어줌
  if a in power and b not in power:
    parent[b] = a
  else:
    parent[a] = b
  
n, m, k = map(int, input().split())

edges = []
result = 0
parent = [0] * (n + 1)

for i in range(1, n + 1):
  parent[i] = i

power = list(map(int, input().split()))

for _ in range(m):
  a, b, cost = map(int, input().split())
  edges.append((cost, a, b))

edges.sort()

for edge in edges:
  cost, a, b = edge

  # 만약 두 노드 중 1개의 노드가 전력과 연결되어 있지 않고 두 부모노드가 다르면 두 노드를 합쳐줌
  if find_parent(parent, a) not in power or find_parent(parent, b) not in power:
    if find_parent(parent, a) != find_parent(parent, b):
      union(parent, a, b)
      result += cost

print(result)
