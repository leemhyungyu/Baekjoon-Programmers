# www.acmicpc.net/problem/14226
# 백준 14226번 문제: 이모티콘

from collections import deque

s = int(input())

graph = [[-1] * (1001) for _ in range(1001)]
graph[0][1] = 0

def dps(s):
  
  queue = deque()

  queue.append((0, 1))
  while queue:
    save, cost = queue.popleft()
    
    # 1. 화면에 있는 이모티콘을 모두 복사해서 클립보드에 저장한다 (방문하지 않았을 때만)
    if graph[cost][cost] == -1:
      queue.append((cost, cost))
      graph[cost][cost] = graph[save][cost] + 1
    
    # 2. 클립보드에 있는 모든 이모티콘을 화면에 붙여넣기 한다. (클립보드에서 붙여넣긴 한 값이 찾는 값보다 작거나 방문하지 않았을 때만)
    if save + cost <= s and graph[save][save + cost] == -1:
      queue.append((save, save + cost))
      graph[save][save+cost] = graph[save][cost] + 1
      
    # 3. 화면에 있는 이모티콘 중 하나를 삭제한다. (-1한 값이 0보다 크고 방문하지 않았을 때만)
    if cost - 1 >= 0 and graph[save][cost - 1] == -1:
      queue.append((save, cost - 1))
      graph[save][cost - 1] = graph[save][cost] + 1
    
    if cost == s:
      return graph[save][cost]
      
print(dps(s))
