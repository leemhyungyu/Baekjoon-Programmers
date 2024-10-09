
from collections import deque
# 우/하/좌/상
dxdy = [(0, 1), (1, 0), (0, -1), (-1, 0)]
dd = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
n, m, k = map(int, input().split())
board = []
for _ in range(n):
    board.append(list(map(int, input().split())))

round = [[0 for _ in range(m)] for _ in range(n)] # 포탑의 공격 라운드
lastAttack = []


isBroken = [[False for _ in range(m)] for _ in range(n)]
visited = [[False for _ in range(m)] for _ in range(n)]

for x in range(n):
    for y in range(m):
        if board[x][y] == 0:
            isBroken[x][y] = True

def solution(n, m, k, board):
    global visited
    global lastAttack

    maxValue = 0
    isFind = True

    for i in range(1, k + 1):
        lastAttack = []
        visited = [[False for _ in range(m)] for _ in range(n)]
        attacker = findAttacker()
        attacked, isFind = findAttacked(attacker)
        round[attacker[0]][attacker[1]] = i
        if not isFind: break
        if lazer(attacker, attacked):
            heel()
        else:
            potan(attacker, attacked)
            heel()
    for i in range(n):
        for j in range(m):
            if board[i][j] > maxValue:
                maxValue = board[i][j]

    if not isFind:
        maxValue = maxValue - (n + m)
        return maxValue
    else: return maxValue
# 공격자 선정 메소드
def findAttacker():
    attacker = (0, 0)
    minValue = 5001
    for x in reversed(range(n)):
        for y in reversed(range(m)):
            if isBroken[x][y]: continue
            nowValue = board[x][y]
            if nowValue < minValue:
                minValue = nowValue
                attacker = (x, y)
            elif nowValue == minValue:
                if round[x][y] > round[attacker[0]][attacker[1]]:
                    attacker = (x, y)
                elif round[x][y] == round[attacker[0]][attacker[1]]:
                    if x + y > attacker[0] + attacker[1]:
                        attacker = (x, y)
                    elif x + y == attacker[0] + attacker[1]:
                        if y > attacker[1]:
                            attacker = (x, y)


    board[attacker[0]][attacker[1]] += (n + m)
    # 2. N + M만큼 공격력이 증가
    return attacker

# 공격받을 사람 선정 메소드
def findAttacked(attacker):
    isFind = False
    maxValue = 0
    lastAttackRound = 1001
    attacked = (0, 0)

    for y in range(m):
        for x in range(n):
            # 1. 자신을 제외한 가장 강한 포탑을 공격
            if isBroken[x][y]: continue
            if (x, y) == attacker: continue
            nowValue = board[x][y]
            isFind = True
            if nowValue > maxValue:
                attacked = (x, y)
                maxValue = nowValue
            elif nowValue == maxValue:
                if round[x][y] < round[attacked[0]][attacked[1]]:
                    attacked = (x, y)
                elif round[x][y] == round[attacked[0]][attacked[1]]:
                    if x + y < attacked[0] + attacked[1]:
                        attacked = (x, y)
                    elif x + y == attacked[0] + attacked[1]:
                        if y < attacked[1]:
                            attacked = (x, y)

    return (attacked, isFind)
# 레이저 공격 메소드
def lazer(attacker, attacked):
    global visited
    global lastAttack
    isSuccess = False
    visited[attacker[0]][attacker[1]] = True
    q = deque()
    rq = deque()

    q.append((attacker, [attacker]))

    while q:
        now, route = q.popleft()
        x, y = now[0], now[1]

        if (x, y) == attacked:
            for i in route:
                rq.append(i)

            isSuccess = True
            break

        # 1. 상하좌우의 4개의 방향으로 움직일 수 있음
        for i in dxdy:
            nx, ny = x + i[0], y + i[1]
            # 3. 가장자리에서 막힌 방향으로 진행하고자하면 반대편으로 나온다.
            if nx < 0: nx = n - 1
            if nx >= n: nx = 0
            if ny < 0: ny = m - 1
            if ny >= m: ny = 0

            # 2. 부서진 포탑이 있는 위치는 지날 수 없다.
            if isBroken[nx][ny] or visited[nx][ny]: continue
            q.append(((nx, ny), route + [(nx, ny)]))
            visited[nx][ny] = True


    # route에 있는 얘를 공격.
    if isSuccess:
        while rq:
            x, y = rq.popleft()
            lastAttack.append((x, y))
            if (x, y) == attacker: continue
            if (x, y) == attacked: continue
            board[x][y] -= (board[attacker[0]][attacker[1]] // 2)
            if board[x][y] <= 0:
                isBroken[x][y] = True

        lastAttack.append(attacked)
        board[attacked[0]][attacked[1]] -= board[attacker[0]][attacker[1]]
        if board[attacked[0]][attacked[1]] <= 0: isBroken[attacked[0]][attacked[1]] = True

    return isSuccess

def potan(attacker, attacked):
    global lastAttack
    x, y = attacked[0], attacked[1]
    lastAttack.append(attacker)
    lastAttack.append(attacked)

    for i in dd:
        nx, ny = x + i[0], y + i[1]
        if nx < 0: nx = n - 1
        if nx >= n: nx = 0
        if ny < 0: ny = m - 1
        if ny >= m: ny = 0
        if (nx, ny) == attacker: continue
        if isBroken[nx][ny]: continue
        board[nx][ny] -= (board[attacker[0]][attacker[1]] // 2)
        if board[nx][ny] <= 0:
            isBroken[nx][ny] = True
        lastAttack.append((nx, ny))

    board[x][y] -= board[attacker[0]][attacker[1]]
    if board[x][y] <= 0:
        isBroken[x][y] = True

def heel():
    for x in range(n):
        for y in range(m):
            if isBroken[x][y]: continue
            if (x, y) in lastAttack: continue
            board[x][y] += 1


    return

print(solution(n, m, k, board))
