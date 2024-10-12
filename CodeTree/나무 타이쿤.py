# start: 11:42, end: 12:10
from collections import deque

n, m = map(int, input().split())
dxdy = [(0, 1), (-1, 1), (-1, 0), (-1, -1), (0, -1), (1, -1), (1, 0), (1, 1)] # → ↗ ↑ ↖ ← ↙ ↓ ↘
dd = [(-1, -1), (1, 1), (1, -1), (-1, 1)]

board = []
orders = []
special = deque()
isSpecial = [[False for _ in range(n)] for _ in range(n)]
re = deque()

special.append((n - 1, 0))
special.append((n - 2, 0))
special.append((n - 1, 1))
special.append((n - 2, 1))


for _ in range(n):
    board.append(list(map(int, input().split())))

for _ in range(m):
    d, p = map(int, input().split())
    orders.append((d - 1, p))

def isRange(x, y):
    return 0 <= x < n and 0 <= y < n

def move(order):
    global special, re
    global board, isSpecial

    isSpecial = [[False for _ in range(n)] for _ in range(n)]
    d, p = order

    while special:
        x, y = special.popleft()
        bx, by = x, y
        for i in range(p):
            nx, ny = bx + dxdy[d][0], by + dxdy[d][1]

            if nx >= n: nx = 0
            if nx < 0: nx = n - 1
            if ny >= n: ny = 0
            if ny < 0: ny = n - 1
            bx, by = nx, ny

        board[bx][by] += 1
        isSpecial[bx][by] = True
        re.append((bx, by))

def grow():
    global re

    while re:
        x, y = re.popleft()
        for i in dd:
            nx, ny = x + i[0], y + i[1]
            if not isRange(nx, ny): continue
            if board[nx][ny] > 0: board[x][y] += 1

def makeSpecial():
    global special

    for i in range(n):
        for j in range(n):
            if isSpecial[i][j]: continue
            if board[i][j] >= 2:
                board[i][j] -= 2
                special.append((i, j))
                isSpecial[i][j] = True

def solution(n, m):
    answer = 0

    for order in orders:
        move(order)
        grow()
        makeSpecial()

    for i in range(n):
        for j in range(n):
            answer += board[i][j]

    return answer

print(solution(n, m))
