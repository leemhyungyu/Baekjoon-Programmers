# start: 14:10

from collections import deque
from curses import start_color

n, m, k = map(int, input().split())
miro = []
positions = []
isExit = [False for _ in range(m)]
dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for _ in range(n):
    miro.append(list(map(int, input().split())))

for _ in range(m):
    positions.append(list(map(int, input().split())))

for i in range(m):
    positions[i] = [positions[i][0] - 1, positions[i][1] - 1]
exit_x, exit_y = map(int, input().split())
exit_x -= 1
exit_y -= 1
count = 0
#
def distance(x1, x2, y1, y2):
    return abs(x1 - x2) + abs(y1 - y2)

# 참가자를 이동시키는 함수
def move():
    global count
    global positions
    global isExit
    # 모든 참가자에 대해 출구와 가까워지는 방향으로 이동
    for i in range(m):
        if isExit[i]: continue
        # if i >= len(positions): i = len(positions) - 1
        x, y = positions[i][0], positions[i][1]
        # 현재 위치에서 출구까지의 거리 구함
        nowDistance = distance(x, exit_x, y, exit_y)
        for j in dxdy:
            nx, ny = x + j[0], y + j[1]
            if 0 <= nx < n and 0 <= ny < n:
                # 해당 방향이 벽으로 막혀있는 경우
                if 1 <= miro[nx][ny] <= 9: continue

                # 상, 하, 좌, 우 이동 시 출구까지의 거리 구함
                nextDistance = distance(nx, exit_x, ny, exit_y)

                # 거리가 최소가 된다면 거리 갱신
                if nextDistance < nowDistance:
                    nowDistance = nextDistance
                    # 움직임
                    if [nx, ny] == [exit_x, exit_y]:
                        isExit[i] = True
                    else:
                        positions[i]= [nx, ny]
                    count += 1

def rotate():
    global exit_x, exit_y
    global positions
    global miro

    minLength = 11
    sqaure_x, sqaure_y = 0, 0

    for length in range(2, n + 1):
        for x in range(n - length + 1):
            for y in range(n - length + 1):
                isContainExit = False
                isContainHuman = False
                containHuman = []
                # 참가자 1명 이상, 출구 포함
                for r in range(x, x + length):
                    for c in range(y, y + length):
                        if [r, c] == [exit_x, exit_y]:
                            isContainExit = True

                        for i in range(len(positions)):
                            if isExit[i]: continue
                            if [r, c] == positions[i]:
                                containHuman.append(i)
                                isContainHuman = True

                sqaure_x, sqaure_y = x, y
                if isContainExit and isContainHuman:
                    if length < minLength:

                        sqaure_x, sqaure_y = x, y
                        minLength = length
                        # 배열 회전
                        rotate_90(sqaure_x, sqaure_y, length)
                        # 참가자 위치 회전
                        for i in containHuman:
                            ox, oy = positions[i][0] - sqaure_x, positions[i][1] - sqaure_y
                            rx, ry = oy, length - ox - 1
                            positions[i] = [rx + sqaure_x, ry + sqaure_y]

                        # 출구 위치 회전
                        ox, oy = exit_x - sqaure_x, exit_y - sqaure_y
                        rx, ry = oy, length - ox - 1
                        exit_x, exit_y = rx + sqaure_x, ry + sqaure_y

def rotate_90(x, y, length):
    global miro
    newArray = [[0] * n for _ in range(n)]

    for i in range(x, x + length):
        for j in range(y, y + length):
            ox, oy = i - x, j - y
            rx, ry = oy, length - ox - 1
            newArray[x + rx][y + ry] = miro[i][j]

    for i in range(x, x + length):
        for j in range(y, y + length):
            # 회전 한 벽은 내구도가 1씩 깎임
            if newArray[i][j] > 0:
                miro[i][j] = newArray[i][j] - 1
            else:
                miro[i][j] = newArray[i][j]

def solution(n, m , k, miro, positions):
    global count

    for i in range(k):
        # 참가자 이동
        move()
        # 미로를 회전시킵니다.
        rotate()

    print(count)
    print(exit_x + 1, exit_y + 1)

solution(n, m, k, miro, positions)
