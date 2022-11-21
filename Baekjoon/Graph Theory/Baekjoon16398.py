# 백준 16398번 문제: 행성 연결
import sys
input = sys.stdin.readline

# 노드의 부모 노드를 찾아 반환해주는 함수
def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])
  return parent[x]

# 두 노드의 부모 노드를 같게 해주는 함수
def union(parent, a, b):
  a = find_parent(parent, a)
  b = find_parent(parent, b)

  if a < b:
    parent[b] = a
  else:
    parent[a] = b

n = int(input())

# 간선의 정보를 저장할 리스트
edges = []
# 행렬을 입력받을 리스트
array = []

result = 0
parent = [0] * (n + 1)

# 각 노드의 부모노드를 자기 자신으로 초기화
for i in range(1, n + 1):
  parent[i] = i

# 행렬의 정보를 입력 받음
for i in range(1, n + 1):
  array.append(list(map(int, input().split())))

# 입력받은 행렬의 정보로 간선의 정보를 저장함
for i in range(0, n):
  for j in range(0, n):
    edges.append((array[i][j], i, j))

# 간선의 비용을 기준으로 정렬함
edges.sort()

# 정렬된 간선의 정보를 하나씩 탐색하여 부모 노드가 다른 노드를 합쳐줌
for edge in edges:
  cost, a, b = edge

  if find_parent(parent, a) != find_parent(parent, b):
    union(parent, a, b)
    result += cost

print(result)
