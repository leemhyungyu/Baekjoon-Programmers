import heapq
import sys
input = sys.stdin.readline
INF = int(1e9)

def dijkstra(start, end):
  q = []
  # 경로를 기록하기 위해 방문했던 노드를 기록하는 리스트를 추가
  heapq.heappush(q, (0, start, [start]))
  distance[start] = 0

  while q:
    dist, now, route = heapq.heappop(q)
    
    if distance[now] < dist:
      continue
    # 현재 방문한 노드가 도착 노드라면 비용과 경로를 반환  
    if now == end:
      return dist, route

    for i in graph[now]:
      cost = i[1] + dist
      if cost < distance[i[0]]:
        distance[i[0]] = cost
        heapq.heappush(q, (cost, i[0], route + [i[0]]))
  
n = int(input())
m = int(input())

graph = [[] for _ in range(n + 1)]
distance = [INF] * (n + 1)

for _ in range(m):
  a, b, c = map(int, input().split())
  graph[a].append((b, c))

start, end = map(int, input().split())

cost, route = dijkstra(start, end)

print(cost)
print(len(route))
for i in route:
  print(i, end = ' ')
