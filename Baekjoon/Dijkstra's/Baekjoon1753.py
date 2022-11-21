import sys
import heapq
input = sys.stdin.readline
INF = int(1e9)

v, e = map(int, input().split())
start = int(input())

# 해당 정보를 입력받을 그래프
graph = [[] for _ in range(v + 1)]
# 간선의 정보를 INF로 초기화해줌
distance = [INF] * (v + 1)

for i in range(e):
  a, b, c = map(int, input().split())
  graph[a].append((b, c))

def dijkstra(start):
  q = []
  heapq.heappush(q, (0, start))
  distance[start] = 0
  while q:
    dist, now = heapq.heappop(q)

    for i in graph[now]:
      cost = dist + i[1]
    # 현재 노드를 통해서 다른 노드로 이동하는 경우가 최단 거리일 경우
      if cost < distance[i[0]]:
        distance[i[0]] = cost
        heapq.heappush(q, (cost, i[0]))
          
dijkstra(start)

for i in range(1, v + 1):
  if distance[i] == INF:
    print("INF")
  else:
    print(distance[i])
