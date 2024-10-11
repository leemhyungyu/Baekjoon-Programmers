from collections import deque

n, m = map(int, input().split())
board = []
dxdy = [(0, 1), (1, 0), (0, -1), (-1, 0)]  # 우, 하, 좌, 상
dice_x, dice_y = 0, 0
dice_up, dice_front, dice_right = 1, 2, 3
dice_d = 0

for _ in range(n):
    board.append(list(map(int, input().split())))

def isRange(x, y):
    return 0 <= x < n and 0 <= y < n

def bfs(x, y, num):
    visited = [[False for _ in range(n)] for _ in range(n)]

    q = deque()
    q.append((x, y))
    visited[x][y] = True
    count = 1

    while q:
        x, y = q.popleft()

        for i in dxdy:
            nx, ny = x + i[0], y + i[1]

            if isRange(nx, ny) and not visited[nx][ny] and board[nx][ny] == num:
                q.append((nx, ny))
                visited[nx][ny] = True
                count += 1

    return count * num

def moveDice(x, y):
    global dice_x, dice_y, dice_d, dice_up, dice_front, dice_right, answer
    nx, ny = x + dxdy[dice_d][0], y + dxdy[dice_d][1]

    # 만약 격자판을 벗어나면 반대로 바뀌고 한 칸 움직임
    if not isRange(nx, ny):
        dice_d = rotate_180_clock(dice_d)
        nx, ny = x + dxdy[dice_d][0], y + dxdy[dice_d][1]

    dice_x, dice_y = nx, ny

    if dice_d == 0:  # 우로 이동
        dice_up, dice_right = 7 - dice_right, dice_up
    elif dice_d == 1:  # 아래로 이동
        dice_up, dice_front = 7 - dice_front, dice_up
    elif dice_d == 2:  # 좌로 이동
        dice_up, dice_right = dice_right, 7 - dice_up
    elif dice_d == 3:
        dice_front, dice_up = 7 - dice_up, dice_front

    dice_down = 7 - dice_up
    if dice_down > board[dice_x][dice_y]:
        dice_d = rotate_90_clock(dice_d)

    elif dice_down < board[dice_x][dice_y]:
        dice_d = rotate_90_nonClock(dice_d)


def rotate_90_clock(d):
    return (d + 1) % 4


def rotate_90_nonClock(d):
    return (d - 1 + 4) % 4


def rotate_180_clock(d):
    return rotate_90_clock(rotate_90_clock(d))


def solution(n, m):
    answer = 0
    for i in range(m):
        moveDice(dice_x, dice_y)
        answer += bfs(dice_x, dice_y, board[dice_x][dice_y])

    return answer

print(solution(n, m))
