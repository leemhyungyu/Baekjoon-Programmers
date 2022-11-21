# 백준 1774번 문제: 우주신과의 교감
import sys
input = sys.stdin.readline

# 해당 노드의 부모 노드를 찾는 함수
def find_parent(parent, x):
  if parent[x] != x:
    parent[x] = find_parent(parent, parent[x])
  return parent[x]

# 두 노드를 같은 부모 노드로 설정하는 함수
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
parent = [0] * (n + 2)
god = []

for i in range(n + 1):
  parent[i] = i
  
for _ in range(n):
  x, y = map(int, input().split())  
  god.append((x, y))
  
for _ in range(m):
  x, y = map(int, input().split())
  union(parent, x - 1, y - 1)

for i in range(n - 1):
  for j in range(i + 1, n):
    x = (god[i][0] - god[j][0])**2
    y = (god[i][1] - god[j][1])**2
    cost = (x + y)**0.5
    edges.append((cost, i, j))

edges.sort()

for edge in edges:
  cost, a, b = edge

  if find_parent(parent, a) != find_parent(parent, b):
    union(parent, a, b)
    result += cost

# 소수점 둘째자리까지 출력
print("%0.2f" % result)
