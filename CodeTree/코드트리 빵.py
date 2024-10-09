# start: 23:10

from collections import deque

n, m = map(int, input().split())
board = []
convi = []
person = [(-1, -1) for _ in range(m + 1)]
blocked = [[False for _ in range(n)] for _ in range(n)]
visited = [[False for _ in range(n)] for _ in range(n)]
isCompleted = [False for _ in range(m)]
step = [[0 for _ in range(n)] for _ in range(n)]
dxdy = [(-1, 0), (0, -1), (0, 1), (1, 0)]  # 상, 좌, 우, 하

for _ in range(n):
    board.append(list(map(int, input().split())))

for _ in range(m):
    convi.append(list(map(int, input().split())))


def solution(n, m, board, convi):
    count = 0
    while True:
        # 모든 사람이 편의점에 도착하면 종료
        if isCompleted == [True for _ in range(m)]:
            break
        moveToConvi(count)
        moveToBaseCamp(count, m)
        count += 1

    return count - 1


def length(x1, x2, y1, y2):
    return abs(x1 - x2) + abs(y1 - y2)


def bfs(sx, sy):
    global blocked
    global visited
    global step

    visited = [[False for _ in range(n)] for _ in range(n)]
    step = [[0 for _ in range(n)] for _ in range(n)]

    visited[sx][sy] = True
    q = deque()
    q.append((sx, sy))

    while q:
        x, y = q.popleft()

        for i in dxdy:
            nx, ny = x + i[0], y + i[1]
            if 0 <= nx < n and 0 <= ny < n:
                if blocked[nx][ny]: continue
                if visited[nx][ny]: continue
                step[nx][ny] = step[x][y] + 1
                visited[nx][ny] = True
                q.append((nx, ny))

def moveToConvi(t):
    global person
    global visited
    global step

    conviArrivalList = []
    if t == 0: return
    for i in range(1, m + 1):
        # 아직 격자내에 배치가 안된 경우
        x, y = convi[i - 1][0] - 1, convi[i - 1][1] - 1  # 편의점 좌표

        if i == t: continue
        if person[i] == (-1, -1): continue

        bfs(x, y)
        now_x, now_y = person[i][0], person[i][1]
        nextPos = (-1, -1)
        minLength = 31

        for j in dxdy:
            nx, ny = now_x + j[0], now_y + j[1]

            if 0 <= nx < n and 0 <= ny < n and visited[nx][ny] and step[nx][ny] < minLength:
                minLength = step[nx][ny]
                nextPos = (nx, ny)

        person[i] = nextPos

        # 편의점에 도달한 경우
        if person[i] == (x, y):
            person[i] = (-1, -1)
            isCompleted[i - 1] = True
            conviArrivalList.append((x, y))

    for i in conviArrivalList:
        blocked[i[0]][i[1]] = True

    return


# 3번 순서
def moveToBaseCamp(t, m):
    global blocked
    global visited
    global step

    if t == 0: return
    if t <= m:
        x1, y1 = convi[t - 1][0] - 1, convi[t - 1][1] - 1  # 편의점 위치 (행, 열)
        bfs(x1, y1)
        pos = (-1, -1)
        minLength = 31
        for i in range(n):
            for j in range(n):
                if visited[i][j] and board[i][j] == 1 and minLength > step[i][j]:
                    minLength = step[i][j]
                    pos = (i, j)

        person[t] = pos  # t번 사람을 베이스 캠프로 이동
        blocked[pos[0]][pos[1]] = True

print(solution(n, m, board, convi))

