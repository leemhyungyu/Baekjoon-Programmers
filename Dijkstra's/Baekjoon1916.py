import sys
import heapq
input = sys.stdin.readline
INF = int(1e9)

n = int(input())
m = int(input())

# 해당 정보를 입력받을 그래프
graph = [[] for _ in range(n + 1)]
# 간선의 정보를 INF로 초기화
distance = [INF] * (n + 1)

for _ in range(m):
  a, b, c = map(int, input().split())
  graph[a].append((b, c))

start, end = map(int, input().split())

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

dijkstra(start)

print(distance[end])
