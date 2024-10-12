from collections import deque

n = int(input())
board = []
length = 1
length_count = 0
count = 0

s_x, s_y, s_d = n // 2, n // 2, 0
dxdy = [(0, -1), (1, 0), (0, 1), (-1, 0)] # 좌, 하, 우, 상

dust_ratio = [
    [
        [0,  0, 2, 0, 0],
        [0, 10, 7, 1, 0],
        [5,  0, 0, 0, 0],
        [0, 10, 7, 1, 0],
        [0,  0, 2, 0, 0],
    ],
    [
        [0,  0, 0,  0, 0],
        [0,  1, 0,  1, 0],
        [2,  7, 0,  7, 2],
        [0, 10, 0, 10, 0],
        [0,  0, 5,  0, 0],
    ],
    [
        [0, 0, 2,  0, 0],
        [0, 1, 7, 10, 0],
        [0, 0, 0,  0, 5],
        [0, 1, 7, 10, 0],
        [0, 0, 2,  0, 0],
    ],
    [
        [0,  0, 5,  0, 0],
        [0, 10, 0, 10, 0],
        [2,  7, 0,  7, 2],
        [0,  1, 0,  1, 0],
        [0,  0, 0,  0, 0],
    ]
]

for _ in range(n):
    board.append(list(map(int, input().split())))

def isRange(x, y):
    return 0 <= x < n and 0 <= y < n

def move():
    global length, length_count, count, s_x, s_y, s_d
    answer = 0
    sum = 0
    # 이동
    nx, ny = s_x + dxdy[s_d][0], s_y + dxdy[s_d][1]
    s_x, s_y = nx, ny

    for i in range(5):
        for j in range(5):
            m_x, m_y = s_x + i - 2, s_y + j - 2
            dust = board[s_x][s_y] * dust_ratio[s_d][i][j] // 100
            if isRange(m_x, m_y):
                board[m_x][m_y] += dust
            else:
                answer += dust

            sum += dust

    dust = board[s_x][s_y] - sum
    nx, ny = s_x + dxdy[s_d][0], s_y + dxdy[s_d][1]

    if isRange(nx, ny):
        board[nx][ny] += dust
    else:
        answer += dust

    board[s_x][s_y] = 0

    length_count += 1

    if length_count == length:
        s_d = (s_d + 1) % 4
        length_count = 0
        count += 1

    if count == 2:
        length += 1
        count = 0

    return answer

def solution():
    answer = 0
    while True:
        if [s_x, s_y] == [0, 0]: break
        answer += move()
    return answer

print(solution())

