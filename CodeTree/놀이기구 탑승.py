# start: 12:33
from ctypes.macholib.framework import framework_info

n = int(input())
student = [[] for _ in range(n * n)]
board = [[0 for i in range(n)] for _ in range(n)]
numbers = []

dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]

for i in range(n * n):
    n0, n1, n2, n3, n4 = map(int, input().split())
    student[n0 - 1] = [n1, n2, n3, n4]
    numbers.append(n0)

def isRange(x, y):
    return 0 <= x < n and 0 <= y < n

def move(number):
    global board
    friend_count = -1
    empty_count = -1
    friend_pos = (-1, -1)
    empty_pos = (-1, -1)

    for x in range(n):
        for y in range(n):
            f_count = 0
            e_count = 0
            # 이미 누가 있는 경우 스킵
            if board[x][y] != 0: continue
            # 해당 위치 상, 하, 좌, 우에 좋아하는 친구가 있는 지 검사.
            for i in dxdy:
                nx, ny = x + i[0], y + i[1]
                if not isRange(nx, ny): continue
                if board[nx][ny] in student[number - 1]:
                    f_count += 1

                if board[nx][ny] == 0:
                    e_count += 1

            if friend_count < f_count:
                friend_count = f_count
                empty_count = e_count
                friend_pos = (x, y)
            elif friend_count == f_count:
                if empty_count < e_count:
                    empty_count = e_count
                    friend_pos = (x, y)


    board[friend_pos[0]][friend_pos[1]] = number

def score():
    score = 0

    for x in range(n):
        for y in range(n):
            number = board[x][y]
            count = 0
            for i in dxdy:
                nx, ny = x + i[0], y + i[1]
                if not isRange(nx, ny): continue
                if board[nx][ny] in student[number - 1]:
                    count += 1

            if count > 0:
                score += 10 ** (count - 1)
    return score

def solution(n):

    for number in numbers:
        move(number)

    return score()

print(solution(n))
