from collections import deque

L, N, Q = map(int, input().split())
dxdy = [(-1, 0), (0, 1), (1, 0), (0, -1)] # 상, 우, 하, 좌
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

info = [[0 for _ in range(L + 1)] for _ in range(L + 1)]
gisaList = []
orders = []
damage = [0 for _ in range(N + 1)]
tempK = [0 for _ in range(N + 1)]
isMoved = [False for _ in range(N + 1)]

# 현재 기사들의 좌표, 체력
r = [0 for _ in range(N + 1)]
c = [0 for _ in range(N + 1)]
h = [0 for _ in range(N + 1)]
w = [0 for _ in range(N + 1)]
k = [0 for _ in range(N + 1)]

# 움직인 뒤 기사들의 좌표
nr = [0 for _ in range(N + 1)]
nc = [0 for _ in range(N + 1)]


for i in range(1, L + 1):
    info[i][1:] = map(int, input().split())

for _ in range(N):
    gisaList.append(list(map(int, input().split())))

for _ in range(Q):
    orders.append(list(map(int, input().split())))

for i in range(len(gisaList)):
    r[i + 1], c[i + 1], h[i + 1], w[i + 1], k[i + 1] = gisaList[i][0], gisaList[i][1], gisaList[i][2], gisaList[i][3], gisaList[i][4]
    tempK[i + 1] = k[i + 1]

def move(index, direction):
    if k[index] <= 0:
        return

    if bfs(index, direction):
        for i in range(1, N + 1):
            r[i] = nr[i]
            c[i] = nc[i]
            k[i] -= damage[i]

def bfs(index, direction):
    q = deque()

    for i in range(1, N + 1):
        damage[i] = 0
        isMoved[i] = False
        nr[i] = r[i]
        nc[i] = c[i]

    q.append(index)
    isMoved[index] = True

    while q:
        x = q.popleft()

        nr[x] += dx[direction]
        nc[x] += dy[direction]

        if nr[x] < 1 or nc[x] < 1 or nr[x] + h[x] - 1 > L or nc[x] + w[x] - 1 > L:
            return False

        for i in range(nr[x], nr[x] + h[x]):
            for j in range(nc[x], nc[x] + w[x]):
                if info[i][j] == 1:
                    damage[x] += 1
                if info[i][j] == 2:
                    return False

        for i in range(1, N + 1):
            if isMoved[i] or k[i] <= 0: continue
            if r[i] > nr[x] + h[x] - 1 or nr[x] > r[i] + h[i] - 1: continue
            if c[i] > nc[x] + w[x] - 1 or nc[x] > c[i] + w[i] - 1: continue

            isMoved[i] = True
            q.append(i)

    damage[index] = 0
    return True

for order in orders:
    index, direction = order[0], order[1]
    move(index, direction)

answer = 0

for i in range(1, N + 1):
    if k[i] <= 0: continue
    answer += (tempK[i] - k[i])

print(answer)
