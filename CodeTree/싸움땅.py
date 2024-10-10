# start: 13:00, end: 14:30

from collections import deque

n, m, k = map(int, input().split()) # 격자 크기, 플레이어 수, 라운드 수
board = [[[] for _ in range(n)] for _ in range(n)]
temp = []
players = []
points = [0 for _ in range(m)]
dxdy = [(-1, 0), (0, 1), (1, 0), (0, -1)] # ↑, →, ↓, ←
gun = [0 for _ in range(m)]

for _ in range(n):
    temp.append(list(map(int, input().split())))

for i in range(n):
    for j in range(n):
        board[i][j] = [temp[i][j]]

for _ in range(m):
    players.append(list(map(int, input().split())))

for i in range(m):
    players[i] = [players[i][0] - 1, players[i][1] - 1, players[i][2], players[i][3]]

def rotate_90(direction):
    return (direction + 1) % 4

def rotate_180(direction):
    return rotate_90(rotate_90(direction))

def solution(n, m, k, board, player):
    # k번 라운드까지 실행
    # move()
    for i in range(k):
        move()

    for point in points:
        print(point, end = " ")

def findGun(x, y):
    global board
    maxGunIndex = 0
    maxGunValue = 0

    if board[x][y] == [0]: return (-1, -1)

    else:
        for i in range(len(board[x][y])):
            if board[x][y][i] > maxGunValue:
                maxGunValue = board[x][y][i]
                maxGunIndex = i

    return (maxGunValue, maxGunIndex)

def move():
    global board
    global players

    for i in range(m):
    # 1. 첫 번째 플레이어부터 본인이 향하고 있는 방향대로 1만큼 이동
        x, y, d, s = players[i]
        nx, ny = x + dxdy[d][0], y + dxdy[d][1]

        if nx < 0 or nx >= n or ny < 0 or ny >= n:
            d = rotate_180(d)
            nx, ny = x + dxdy[d][0], y + dxdy[d][1]

        players[i] = [nx, ny, d, s]
        # 만약 격자를 벗어나면 반대 방향으로 1만큼 이동

        targetPlayer = -1

        for j in range(m):
            if j == i: continue
            if [nx, ny] != [players[j][0], players[j][1]]: continue
            targetPlayer = j

        maxGunValue, maxGunIndex = findGun(nx, ny)

        # 플레이어가 있는 경우
        if targetPlayer != -1:
        # 플레이어의 초기 능력치 + 총의 공격력의 합이 큰 플레이어가 승리

            loser = -1
            winner = -1
            player_1 = players[i][3] + gun[i]
            player_2 = players[targetPlayer][3] + gun[targetPlayer]
            if player_1 > player_2:
                # 점수는 둘의 능력치(초기 능력치 + 총 공격력) 차이 만큼 획득
                points[i] += player_1 - player_2
                winner, loser = i, targetPlayer
            elif player_1 == player_2:
                # 수치가 같은 경우에 초기 능력치가 높은 플레이어가 승리
                if players[i][3] > players[targetPlayer][3]:
                    winner, loser = i, targetPlayer
                else:
                    winner, loser = targetPlayer, i
            else:
                points[targetPlayer] += player_2 - player_1
                winner, loser = targetPlayer, i

            moveToLoser(loser, nx, ny)
            moveToWinner(winner, nx, ny)

        # 2. 이동한 방향에 플레이어가 없다면 총이 있는지 확인
        elif maxGunIndex != -1:
            if gun[i] == 0:
                # 플레이어는 총을 획득
                gun[i] = maxGunValue
                board[nx][ny][maxGunIndex] = 0
            else:
                if maxGunValue > gun[i]:
                    board[nx][ny][maxGunIndex] = gun[i]
                    gun[i] = maxGunValue
            # 이미 플레이어가 총을 가지고 있는 경우 더 공격력이 쎈 총 획득, 나머지 총은 격자에 둠


    return


def moveToLoser(loser, x, y):
    global board
    # 1. 진 플레이어의 경우
    # 총을 해당 격자에 내려놓고 플레이어가 가지고 있는 방향대로 1칸 이동
    board[x][y] += [gun[loser]]
    gun[loser] = 0
    x, y, d, s = players[loser]
    nx, ny = x + dxdy[d][0], y + dxdy[d][1]
    # 이동하려는 칸에 플레이어가 있으면 이동할 수 있을 때까지 90도씩 회전함

    playerPos = []

    for i in range(m):
        playerPos.append((players[i][0], players[i][1]))

    while True:
        if (nx, ny) in playerPos or (nx < 0 or nx >= n or ny < 0 or ny >= n):
            d = rotate_90(d)
            nx, ny = x + dxdy[d][0], y + dxdy[d][1]
        else:
            break

    # 이동
    players[loser] = [nx, ny, d, s]
    maxGunValue, maxGunIndex = findGun(nx, ny)

    # 이동하려는 칸에 총이 있으면 공격력이 높은 총 획득, 나머지 총 내려놓음
    if maxGunIndex != -1:
        if gun[loser] == 0:
            # 플레이어는 총을 획득
            gun[loser] = maxGunValue
            board[nx][ny][maxGunIndex] = 0
        else:
            if maxGunValue > gun[loser]:
                board[nx][ny][maxGunIndex] = gun[loser]
                gun[loser] = maxGunValue

    return

def moveToWinner(winner, x, y):
    global board
    # 2. 이긴 플레이어의 경우
    # 현재 칸에 총이 있는 경우 가장 공격력 높은 총 획득, 나머지 총 내려놓음
    maxGunValue, maxGunIndex = findGun(x, y)

    if maxGunIndex != -1:
        if gun[winner] == 0:
            # 플레이어는 총을 획득
            gun[winner] = maxGunValue
            board[x][y][maxGunIndex] = 0
        else:
            if maxGunValue > gun[winner]:
                board[x][y][maxGunIndex] = gun[winner]
                gun[winner] = maxGunValue

    return


solution(n, m, k, board, players)
