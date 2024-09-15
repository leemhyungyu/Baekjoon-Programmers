
from collections import deque

def solution(cards):
    cards = [0] + cards
    visited = [False for _ in range(len(cards))]
    answer = []
    def bfs(x):
        queue = deque()
        queue.append((x, 1))
        visited[x] = True
        while queue:
            now, count = queue.popleft()
            nx = cards[now]
            if visited[nx]: return count
            queue.append((nx, count + 1))
            visited[nx] = True
                
        return 0
    
    for i in range(1, len(cards)):
        if not visited[i]:
            answer.append(bfs(i))
        
    answer.sort()
    answer.reverse()

    if len(answer) > 1:
        return answer[0] * answer[1]
    else:
        return 0
