import heapq
import sys
input = sys.stdin.readline
INF = int(1e9)

# 다익스트라 알고리즘
def dijkstra(start):
  q = []
  heapq.heappush(q, (0, start))
  distance[start] = 0

  while q:
    dist, now = heapq.heappop(q)

    if distance[now] < dist:
      continue

    for i in graph[now]:
      cost = dist + i[1]
      if cost < distance[i[0]]:
        distance[i[0]] = cost
        heapq.heappush(q, (cost, i[0]))
    
  
n, m, k, x = map(int, input().split())

graph = [[] for _ in range(n + 1)]
distance = [INF] * (n + 1)

for _ in range(m):
  a, b = map(int, input().split())
  graph[a].append((b, 1))

dijkstra(x)

temp = 0

for i in range(1, n + 1):
  # 도달 거리가 k일때 그대로 정점 출력
  if distance[i] == k:
    print(i)
  # 그렇지 않은 경우 temp변수에 +1을해 n과 같아지면 -1 출력
  else:
    temp += 1

  if temp == n:
    print(-1)
