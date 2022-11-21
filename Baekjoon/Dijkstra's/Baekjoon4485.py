import heapq

INF = int(1e9)

# 상, 하, 좌, 우 이동시 x, y좌표의 변화 리스트
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

count = 1

# 다익스트라 알고리즘
def dijkstra():
  q = []
  # (0, 0)에서의 값 초기화
  heapq.heappush(q, (graph[0][0], 0, 0))
  lossed[0][0] = graph[0][0]

  while q:
    loss, x, y = heapq.heappop(q)

    # 이미 처리된 좌표라면 무시
    if lossed[x][y] < loss:
      continue
      
    # 상, 하, 좌, 우 좌표를 탐색
    for i in range(4):
      nx = dx[i] + x
      ny = dy[i] + y

      if 0 <= nx < n and 0 <= ny < n:
        cost = graph[nx][ny] + loss
        if cost < lossed[nx][ny]:
          lossed[nx][ny] = cost
          heapq.heappush(q, (cost, nx, ny))

  return lossed[n-1][n-1]    
          
while True:
  n = int(input())
  
  # 종료 조건
  if n == 0:
    break
    
  graph = []
  lossed = [[INF] * n for _ in range(n)]
  
  for _ in range(n):
    graph.append(list(map(int, input().split())))

  print("Problem", count, end = '')
  print(":", dijkstra())
  count += 1
