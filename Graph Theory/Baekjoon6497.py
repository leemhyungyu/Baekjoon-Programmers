# 백준 6497번 문제: 전력난
import sys
input = sys.stdin.readline

# 해당 노드의 부모 노드를 반환해주는 함수
def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])
  return parent[x]

# 두 노드의 부모 노드를 같게해주는 함수(같은 집합으로 만듬)
def union(parent, a, b):
  a = find_parent(parent, a)
  b = find_parent(parent, b)

  if a < b:
    parent[b] = a
  else:
    parent[a] = b

while True:
  n, m = map(int, input().split())
  
  # 테스트 케이스 종료 조건
  if n == 0 and m == 0:
    break
  
  edges = []
  max_result = 0
  result = 0
  parent = [0] * (n)

  for i in range(0, n):
    parent[i] = i
  
  for _ in range(m):
    x, y, z = map(int, input().split())
    edges.append((z, x, y))

  edges.sort() # 간선을 기준으로 정렬함

  for edge in edges:
    cost, x, y = edge

    max_result += cost # 모든 간선의 합
    
    # 두 노드의 부모노드가 같지 않으면(같은 집합이 아니면) 두 노드의 부모 노드를 같게 해줌(두 노드를 같은 집합으로 만듬)
    if find_parent(parent, x) != find_parent(parent, y):
      union(parent, x, y)
      result += cost
      
  # 모든 간선의 합에서 최소 경로를 빼주고 출력
  print(max_result - result)
