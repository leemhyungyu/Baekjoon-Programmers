# start: 15:53
from calendar import month
from collections import deque

md = [(-1, 0), (-1, -1), (0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 1)] #  ↑, ↖, ←, ↙, ↓, ↘, →, ↗
pd = [(-1, 0), (0, -1), (1, 0), (0, 1)] # 상, 좌, 하, 우
egg = deque()
mosters = []
board = [[0 for _ in range(4)] for _ in range(4)]
death = [[0 for _ in range(4)] for _ in range(4)]

m, t = map(int, input().split())
r, c = map(int, input().split())
r -= 1
c -= 1

for _ in range(m):
    x, y, d = map(int, input().split())
    board[x - 1][y - 1] += 1
    mosters.append((x - 1, y - 1, d - 1))

# 알 부화
def born():
    global egg
    global board

    while egg:
        x, y, d = egg.popleft()
        mosters.append((x, y, d))
        board[x][y] += 1

# 몬스터 복제
def copyEgg():
    global egg

    for monster in mosters:
        if monster == (-1, -1, -1): continue
        egg.append(monster)

def rotate_45(d):
    return (d + 1) % 8


def isRange(x, y):
    return 0 <= x < 4 and 0 <= y < 4

def moveMonsters(round):
    for i in range(len(mosters)):
        x, y, d = mosters[i]
        if (x, y, d) == (-1, -1, -1): continue
        canMoved = False
        for _ in range(8):
            nx, ny = x + md[d][0], y + md[d][1]
            # 움직이려는 칸에 팩맨 위치 X
            # 격자 안에 포함
            # 움직이려는 칸에 시체 존재 X -> 아직 구현 X
            if [nx, ny] != [r, c] and isRange(nx, ny) and not (death[nx][ny] > 0 and round - 2 <= death[nx][ny] <= round - 1):
                # d = rotate_45(d)
                canMoved = True
                break

            d = rotate_45(d)

        # 8 방향 검사 -> 이동 X -> 움직이지 않음
        if not canMoved:
            continue
        # 이동
        board[x][y] -= 1
        board[nx][ny] += 1
        mosters[i] = (nx, ny, d)


def movePackMan(round):
    global r, c
    temp_r, temp_c = -1, -1
    q = deque()
    rq = deque()
    maxValue = -1

    for i in pd:
        for j in pd:
            for k in pd:
                first = r + i[0], c + i[1]
                second = first[0] + j[0], first[1] + j[1]
                thrid = second[0] + k[0], second[1] + k[1]
                visited = []

                # if first == second or first == thrid or second == thrid: continue
                if isRange(first[0], first[1]) and isRange(second[0], second[1]) and isRange(thrid[0], thrid[1]):
                    nowValue = board[first[0]][first[1]]
                    visited.append(first)

                    if not second in visited:
                        nowValue += board[second[0]][second[1]]
                        visited.append(second)
                    if not thrid in visited:
                        nowValue += board[thrid[0]][thrid[1]]
                        
                    if nowValue > maxValue:
                        maxValue = nowValue
                        rq = deque()
                        rq.append((first[0], first[1]))
                        rq.append((second[0], second[1]))
                        rq.append((thrid[0], thrid[1]))
                        temp_r, temp_c = thrid[0], thrid[1]

    r, c = temp_r, temp_c
    while rq:
        x, y = rq.popleft()

        for j in range(len(mosters)):
            monster = mosters[j]
            if [monster[0], monster[1]] == [x, y]:
                mosters[j] = (-1, -1, -1)

        if board[x][y] > 0: death[x][y] = round
        board[x][y] = 0

    for j in range(len(mosters)):
        x, y, d = mosters[j]
        if [x, y] == [r, c]:
            mosters[j] = (-1, -1, -1)

def solution(m, t):
    answer = 0


    for i in range(1, t + 1):
        copyEgg()
        moveMonsters(i)
        movePackMan(i)
        born()
    for i in mosters:
        if i == (-1, -1, -1): continue
        answer += 1
    return answer

print(solution(m, t))


