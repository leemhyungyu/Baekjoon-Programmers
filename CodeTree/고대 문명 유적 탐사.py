from collections import deque

K, M = map(int, input().split())
array = []
for _ in range(5):
    array.append(list(map(int, input().split())))

numbers = deque()

for i in list(map(int, input().split())):
    numbers.append(i)


choices = [(1, 1), (2, 1), (3, 1), (1, 2), (2, 2), (3, 2), (1, 3), (2, 3), (3, 3)]
visited = [[False for _ in range(5)] for _ in range(5)]
dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]

def solution(K, M, array):
    answer = [0 for _ in range(K)]
    nowTurn = 0

    for i in range(K):
        global visited
        visited = [[False for _ in range(5)] for _ in range(5)]

        maxValue = 0
        maxPosition = (0, 0, 0) # (x, y, degree)
        tempArray = [[]]

        for degree in [0, 90, 180, 270]:
            for choice in choices:
                    visited = [[False for _ in range(5)] for _ in range(5)]
                    newArray = spinArray(degree, choice, array)
                    nowValue = find(newArray)
                    if maxValue < nowValue:
                        maxValue = nowValue
                        tempArray = newArray

        if maxValue == 0: # 격자 선택, 회전해도 유뮬을 찾을 수 없는 경우
            break

        else: # 격자 선택, 회전해서 유물을 찾을 수 있는 경우
            array = tempArray
            fill(array)
            answer[i] += maxValue

            # 회전하지 않아도 유물이 발견되는 경우
            while True:
                visited = [[False for _ in range(5)] for _ in range(5)]
                nowValue = find(array)

                fill(array)
                if nowValue == 0:
                    break
                else:

                    answer[i] += nowValue

    for i in answer:
        if i != 0:
            print(i, end = " ")

def fill(array):

    global numbers
    for i in range(5):
        for j in reversed(range(5)):
            if array[j][i] == 0:
                array[j][i] = numbers.popleft()


def bfs(x, y, target, array):
    global visited
    count = 0
    queue = deque()
    route = deque()

    queue.append((x, y))
    visited[x][y] = True
    while queue:
        x, y = queue.popleft()

        if array[x][y] == target:
            route.append((x, y))
            count += 1

        for i in dxdy:
            nx = x + i[0]
            ny = y + i[1]

            if 0 <= nx < 5 and 0 <= ny < 5:
                if visited[nx][ny]: continue
                if array[nx][ny] == target:
                    queue.append((nx, ny))
                    visited[nx][ny] = True
    if count >= 3:
        for i in route:
            array[i[0]][i[1]] = 0

        return count
    else:
        return 0

def find(array):
    count = 0
    global visited
    for target in range(1, 8):
        for x in range(0, 5):
            for y in range(0, 5):
                if visited[x][y]: continue
                if array[x][y] == target:
                    count += bfs(x, y, target, array)

    return count


def spinArray(degree, choice, array):
    newArray = [[0 for _ in range(5)] for _ in range(5)]
    x, y = choice[0] - 1, choice[1] - 1
    for i in range(5):
        for j in range(5):
            newArray[i][j] = array[i][j]

    for _ in range(degree // 90):
        temp = newArray[x][y + 2]
        newArray[x][y + 2] = newArray[x][y]
        newArray[x][y] = newArray[x + 2][y]
        newArray[x + 2][y] = newArray[x + 2][y+ 2]
        newArray[x + 2][y + 2] = temp
        temp = newArray[x + 1][y + 2]
        newArray[x + 1][y + 2] = newArray[x][y + 1]
        newArray[x][y + 1] = newArray[x + 1][y]
        newArray[x + 1][y] = newArray[x + 2][y + 1]
        newArray[x + 2][y + 1] = temp

    return newArray

solution(K, M, array)
