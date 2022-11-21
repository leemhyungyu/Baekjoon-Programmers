# 백준 1647번 문제
import sys
input = sys.stdin.readline

# 특정 원소가 속한 집합 찾기 (부모 노드)
def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])

  return parent[x]

# 두 원소가 속한 집합 합치기
def union_parent(parent, a, b):
  a = find_parent(parent, a)
  b = find_parent(parent, b)

  if a < b:
    parent[b] = a
  else:
    parent[a] = b

n, m = map(int, input().split())

parent = [0] * (n + 1)

edges = []
result = 0
# 최소 신장의 개수를 저장하는 변수
count = 0

for _ in range(m):
  a, b, cost = map(int, input().split())
  edges.append((cost, a, b))

# 간선의 정보를 비용순으로 정렬
edges.sort()

for i in range(1, n + 1):
  parent[i] = i
  

for edge in edges:
  cost, a, b = edge
  # 만약 두 노드가 다른 집합이면 두 집합을 합쳐줌
  if find_parent(parent, a) != find_parent(parent, b):
    union_parent(parent, a, b)
    result += cost
    count += 1
  # 최소 신장의 개수가 정점의 개수 -2가되면 출력
  if count == n - 2:
    break

print(result)
