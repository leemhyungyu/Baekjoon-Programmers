import heapq
INF = int(1e9)

# 상, 하, 좌, 우 이동시 x, y좌표 변화 리스트
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

def dijkstra():
  q = []
  heapq.heappush(q, (0, 0, 0))

  changed[0][0] = 0

  while q:
    change, x, y = heapq.heappop(q)

    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y
  
      if 0 <= nx < n and 0 <= ny < n:
        # 그래프 값이 0일때 벽을 깨야하므로 + 1
        if graph[nx][ny] == 0:
          cost = change + 1
        # 그렇지 않은 경우
        else: 
          cost = change

        if cost < changed[nx][ny]:
          changed[nx][ny] = cost
          heapq.heappush(q, (cost, nx, ny))

  
n = int(input())
graph = []
# 각 좌표마다 벽을 깨는 횟수를 저장하는 리스트
changed = [[INF] * (n + 1) for _ in range(n + 1)]

for _ in range(n):
  graph.append(list(map(int, input())))

dijkstra()

print(changed[n - 1][n - 1])
