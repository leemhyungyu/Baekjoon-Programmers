# 백문 1922번 문제: 네트워크 연결

import sys
input = sys.stdin.readline

# 해당 노드의 부모 노드를 찾는 함수
def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])
  return parent[x]
  
# 두 노드의 부모 노드를 같게만드는 함수
def union_parent(parent, a, b):
  a = find_parent(parent, a)
  b = find_parent(parent, b)
  
  if a < b:
    parent[b] = a
  else:
    parent[a] = b

n = int(input())
m = int(input())

# 간선의 정보와 최소 연결비용을 저장하는 변수
edges = []
result = 0


for _ in range(m):
  a, b, cost = map(int, input().split())
  edges.append((cost, a, b))

edges.sort()

# 부모 노드의 정보를 저장하는 리스트
parent = [0] * (n + 1)

# 노드의 부모 노드를 자신으로 초기화
for i in range(1, n + 1):
  parent[i] = i

# 간선의 비용이 낮은 순으로 정렬된 간선들을 순서대로 탐색해 같은 집합의 노드가 아니면 같은 집합으로 합쳐주고 비용을 저장함
for edge in edges:
  cost, a, b = edge

  if find_parent(parent, a) != find_parent(parent, b):
    union_parent(parent, a, b)
    result += cost

print(result)
