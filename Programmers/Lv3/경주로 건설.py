from collections import deque


def calculateCost(now, next, cost):
    if (now == 0 or now == 2) and (next == 0 or next == 2): return cost + 100
    if (now == 1 or now == 3) and (next == 1 or next == 3): return cost + 100
    if (now == 0 or now == 2) and (next == 1 or next == 3): return cost + 600
    if (now == 1 or now == 3) and (next == 0 or next == 2): return cost + 600
    
def solution(board):
    dxdy = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    n = len(board)
    costs = [[0 for _ in range(n)] for _ in range(n)]
    answer = []
    
    def bfs(x, y, direction):
        queue = deque([(x, y, 0, direction)])
        costs[0][0] = 1
        while queue:
            x, y, cost, nowDirection = queue.popleft()
            
            if x == n - 1 and y == n - 1: 
                answer.append(cost)
                continue
            
            for nextDirection in range(4):
                nx = x + dxdy[nextDirection][0]
                ny = y + dxdy[nextDirection][1]

                if 0 <= nx < n and 0 <= ny < n:
                    if board[nx][ny] == 1: continue
                    newCost = calculateCost(nowDirection, nextDirection, cost)
                    if costs[nx][ny] == 0 or costs[nx][ny] >= newCost:
                        costs[nx][ny] = newCost
                        queue.append([nx, ny, newCost, nextDirection])
            
    bfs(0, 0, 0)
    bfs(0, 0, 1)
    
    return min(answer)
