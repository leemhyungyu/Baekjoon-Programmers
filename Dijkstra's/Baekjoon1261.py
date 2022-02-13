import heapq

INF = int(1e9)
m, n = map(int, input().split())

graph = []

#각 좌표에서의 벽을 부순 횟수를 저장하는 리스트
smashed = [[INF] * m for _ in range(n)]

for i in range(n):
  graph.append(list(map(int, input())))

# 상, 하, 좌, 우 이동시 좌표값 변화 리스트
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

def dijkstra():
  q = []
  smashed[0][0] = 0
  heapq.heappush(q, (0, 0, 0)) 

  while q:
    smash, x, y = heapq.heappop(q)

    if smashed[x][y] < smash:
      continue

    # 상, 하, 좌, 우를 확인해 각 좌표에서의 벽을 부순 횟수를 저장 (최소값)
    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y
      
      if 0 <= nx < n and 0 <= ny < m:
        cost = graph[nx][ny] + smash
        if cost < smashed[nx][ny]:
          smashed[nx][ny] = cost
          heapq.heappush(q, (cost, nx, ny))

dijkstra()
    
print(smashed[n-1][m-1])
