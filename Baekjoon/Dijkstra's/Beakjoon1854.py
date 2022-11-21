# 백준 185번 문제: x번째 도시에서 y번째 도시로 가는 k번째 최단경로 출력

import heapq
import sys
input = sys.stdin.readline
INF = int(1e9)

# 다익스트라 알고리즘
def dijkstra(start):
  q = []
  heapq.heappush(q, (0, start))
  distance[start][0] = 0

  while q:
    dist, now = heapq.heappop(q)

    for i in graph[now]:
      cost = dist + i[1]
      if cost < distance[i[0]][k - 1]:
        distance[i[0]][k - 1] = cost
        distance[i[0]].sort()
        heapq.heappush(q, (cost, i[0]))
      
  
n, m ,k = map(int, input().split())

graph = [[] for _ in range(n + 1)]

# k번째 최단 경로를 저장하기 위해 2차원 리스트로 저장
distance = [[INF] * k for _ in range(n + 1)]

for _ in range(m):
  a, b, c = map(int, input().split())
  graph[a].append((b, c))

dijkstra(1)

for i in range(1, n + 1):
  if distance[i][k - 1] == INF:
    print(-1)
  else:
    print(distance[i][k - 1])
