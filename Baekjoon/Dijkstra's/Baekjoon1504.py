import heapq
import sys
input = sys.stdin.readline
INF = int(1e9)

n, e = map(int, input().split())
graph = [[] for _ in range(n + 1)]

# 다익스트라 알고리즘 
def dijkstra(start, end):
  
  distance = [INF] * (n + 1)
  
  q = []
  heapq.heappush(q, (0, start))
  distance[start] = 0

  while q:

    dist, now = heapq.heappop(q)

    if distance[now] < dist:
      continue

    if now == end:
      return dist
      
    for i in graph[now]:
      cost = dist + i[1]
      if cost < distance[i[0]]:
        distance[i[0]] = cost
        heapq.heappush(q, (cost, i[0]))
  
for _ in range(e):
  a, b, c = map(int, input().split())
  graph[a].append((b, c))
  graph[b].append((a, c))

v1, v2 = map(int, input().split())

# 간선의 개수가 0일 경우 -1 출력
if e == 0:
  print(-1)
# 그렇지 않은 경우
else:
  # 1 -> v1 -> v2 -> n 까지의 거리 
  result_1 = dijkstra(1, v1) + dijkstra(v1, v2) + dijkstra(v2, n)
  # 1 -> v2 -> v1 -> n 까지의 거리
  result_2 = dijkstra(1, v2) + dijkstra(v2, v1) + dijkstra(v1, n)

  # 두 경로가 INF보다 크면 -1 출력
  if result_1 > INF and result_2 > INF:
    print(-1)
  # 그렇지 않은 경우 더 작은 값 출력
  else:
    print(min(result_1, result_2))
  
