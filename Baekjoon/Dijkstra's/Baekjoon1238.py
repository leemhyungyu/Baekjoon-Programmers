import sys
import heapq
input = sys.stdin.readline
INF = int(1e9)

n, m, x = map(int, input().split())

# 해당 정보를 입력받을 그래프
graph = [[] for _ in range(n + 1)]

for _ in range(m):
  a, b, c = map(int, input().split())
  graph[a].append((b, c))

# 다익스트라 알고리즘
def dijkstra(start):
  
  distance = [INF] * (n + 1)
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

  return distance

# 다익스트라의 결과를 저장할 리스트
dijkstra_result = [0] * (n + 1)
# 끝점에서의 다익스트라 결과
end_value = dijkstra(x)
# 소요시간을 저장하는 리스트
time = []

for i in range(1, n + 1):
  dijkstra_result[i] = dijkstra(i)
  time.append(dijkstra_result[i][x] + end_value[i])
  
print(max(time))

