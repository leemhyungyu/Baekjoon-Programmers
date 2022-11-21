# 백준 4386번 문제: 별자리
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

n = int(input())
star = [] # 별의 좌표를 저장하는 리스트
parent = [0] * (n + 1)
edges = []
result = 0

for i in range(1, n + 1):
  a, b = map(float, input().split())
  star.append((a, b, i))

for i in range(1, n + 1):
  parent[i] = i

# 두 별 사이의 거리를 계산
for i in range(n - 1): 
  for j in range(i + 1, n): 
    x = abs(star[i][0] - star[j][0])
    y = abs(star[i][1] - star[j][1])
    d = round((x**2 + y**2)**0.5, 2) # 두 별 사이의 거리 
    edges.append((d, i, j))

# 저장된 간선의 정보를 정렬
edges.sort()

# 별의 거리를 기준으로 정렬된 간선을 탐색하여 최소 비용 구함
for edge in edges:
  cost, a, b = edge

  if find_parent(parent, a) != find_parent(parent, b):
    union(parent, a, b)
    result += cost

print(result)
