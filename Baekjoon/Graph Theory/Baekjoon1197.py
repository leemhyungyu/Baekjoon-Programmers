# 백준 1197번 문제: 최소 스패닝 트리
# 그래프가 주어졌을 때 최소 스패닝 트리를 구하는 프로그램
# 최소 스패닝 트리: 주어진 그래프의 모든 정점들을 연결하는 부분 그래프 중에서 그 가중치의 합이 최소인 트리.

import sys
input = sys.stdin.readline

# 특정 노드의 부모 노드를 반환하는 함수
def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])

  return parent[x]

# 두 노드를 같은 집합으로 합쳐주는 함수
def union_parent(parent, a, b):
  a = find_parent(parent, a)
  b = find_parent(parent, b)

  if a < b:
    parent[b] = a
  else: 
    parent[a] = b
  
v, e = map(int, input().split())

# 간선의 정보와 최종 가중치를 담을 변수
edges = []
result = 0

# 부모 테이블
parent = [0] * (v + 1)

# 부모를 자기 자신으로 초기화
for i in range(1, v + 1):
  parent[i] = i
  
for _ in range(e):
  a, b, cost = map(int, input().split())
  edges.append((cost, a, b))

edges.sort()

# 간선을 하나씩 확인하며 제일 적은 값을 가지고, 같은 집합이 아닌 정점을 같은 집합으로 합쳐줌
for edge in edges:
  cost, a, b = edge

  if find_parent(parent, a) != find_parent(parent, b):
    union_parent(parent, a, b)
    result += cost

print(result)
