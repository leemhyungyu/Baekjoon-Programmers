# start: 12:50
n, m, h, k = map(int, input().split())
movers = []
h_movers = []
v_movers = []
line = 1
line_count = 0
move_count = 0
trees = []
direction = 0
visited = [[False for _ in range(n)] for _ in range(n)]
c_x, c_y = n // 2, n // 2 # 술래 초기 위치
c_d = 0 # 술래 초기 방향
dxdy = [(-1, 0), (0, 1), (1, 0), (0, -1)] # 상, 우, 하, 좌
isCatced = [False for _ in range(m)] # 도망자 잡혔는지 아닌지
for _ in range(m):
    # 도망자의 방향에 따라 좌우, 상하 도망자 구분
    x, y, d = map(int, input().split())
    if d == 1: # 좌우 도망자
        h_movers.append((x - 1, y - 1, 1))
    else: # 상하 도망자
        v_movers.append((x - 1, y - 1, 2))


h_catced = [False for _ in range(len(h_movers))] # 도망자 잡혔는지 아닌지
v_catced = [False for _ in range(len(v_movers))] # 도망자 잡혔는지 아닌지

for _ in range(h):
    x, y = map(int, input().split())
    trees.append((x - 1, y - 1))

def length(x1, x2, y1, y2):
    return abs(x1 -x2) + abs(y1 - y2)

def isRange(x, y):
    # 격자벗어나면 False
    return 0 <= x < n and 0 <= y < n

def changeDirection(d):
    if d == 1: return 3
    if d == 3: return 1
    if d == 0: return 2
    if d == 2: return 0

# 도망자 움직이는 메소드
def moveMovers():
    # 술래와의 거리가 3이하인 도망자만 움직임
    for i in range(len(h_movers)):
        if h_catced[i]: continue
        mover = h_movers[i]
        m_x, m_y, d = mover[0], mover[1], mover[2]
        if length(m_x, c_x, m_y, c_y) > 3: continue
        # 이동하는 위치에 술래가 있으면 움직임 X
        nx, ny = m_x + dxdy[d][0], m_y + dxdy[d][1]
        if [nx, ny] == [c_x, c_y]: continue
        # 다음 위치가 격자를 벗아나는지 확인
        if isRange(nx, ny):
            # 격자 안벗어남 -> 움직임
            h_movers[i] = (nx, ny, d)
        else:
            nd = changeDirection(d)
            nx, ny = m_x + dxdy[nd][0], m_y + dxdy[nd][1]
            if [nx, ny] == [c_x, c_y]:
                h_movers[i] = (m_x, m_y, nd)
                continue
            else:
            # 격자 벗어남 -> 방향 반대로 틀고 움직임
                h_movers[i] = (nx, ny, nd)

    for i in range(len(v_movers)):
        if v_catced[i]: continue
        mover = v_movers[i]
        m_x, m_y, d = mover[0], mover[1], mover[2]
        if length(m_x, c_x, m_y, c_y) > 3: continue
        # 이동하는 위치에 술래가 있으면 움직임 X
        nx, ny = m_x + dxdy[d][0], m_y + dxdy[d][1]
        if [nx, ny] == [c_x, c_y]: continue
        # 다음 위치가 격자를 벗아나는지 확인
        if isRange(nx, ny):
            # 격자 안벗어남 -> 움직임
            v_movers[i] = (nx, ny, d)
        else:
            nd = changeDirection(d)
            nx, ny = m_x + dxdy[nd][0], m_y + dxdy[nd][1]
            if [nx, ny] == [c_x, c_y]:
                v_movers[i] = (m_x, m_y, nd)
                continue
            else:
            # 격자 벗어남 -> 방향 반대로 틀고 움직임
                v_movers[i] = (nx, ny, nd)

def moveChatcer_nonClock():
    global move_count
    global line_count
    global line
    global c_x, c_y, c_d, direction
    visited[c_x][c_y] = True
    # dxdy = [(-1, 0), (0, 1), (1, 0), (0, -1)]  # 상, 우, 하, 좌
    if c_d == 0:
        nx = c_x - 1

        if not isRange(nx - 1, c_y) or visited[nx - 1][c_y]:
            # 왼쪽으로 꺾음
            c_d = 3
        c_x = nx

    elif c_d == 1:
        ny = c_y + 1

        if not isRange(c_x, ny + 1) or visited[c_x][ny + 1]:
            # 위로 꺾음
            c_d = 0
        c_y = ny

    elif c_d == 2:

        nx = c_x + 1
        if not isRange(nx + 1, c_y) or visited[nx + 1][c_y]:
            # 오른쪽으로 꺾음
            c_d = 1
        c_x = nx
    elif c_d == 3:
        ny = c_y - 1

        if not isRange(c_x, ny - 1) or visited[c_x][ny - 1]:
            # 아래로 꺾음
            c_d = 2
        c_y = ny

    if [c_x, c_y] == [n // 2, n // 2]:
        direction = 0
        c_d = 0
        move_count = 0
        line_count = 0
        line = 1

def moveCatcher_clock():
    global move_count
    global line_count
    global line
    global c_x, c_y, c_d, direction
    global visited

    nx, ny = c_x + dxdy[c_d][0], c_y + dxdy[c_d][1]
    line_count += 1

    if line_count == line:
        c_d = (c_d + 1) % 4
        line_count = 0
        move_count += 1

    if move_count == 2:
        line += 1
        move_count = 0

    if [nx, ny] == [0, 0]:
        direction = 1
        c_d = 2
        visited = [[False for _ in range(n)] for _ in range(n)]

    c_x, c_y = nx, ny

def catch(round):
    b_x, b_y = c_x, c_y
    count = 0
    for i in range(3):
        if i == 0:
            nx, ny = b_x, b_y
        else:
            nx, ny = b_x + dxdy[c_d][0], b_y + dxdy[c_d][1]

        b_x, b_y = nx, ny
        if isRange(nx, ny):
            # 나무를 만난경우 스킵
            if (nx, ny) in trees: continue
            for i in range(len(h_movers)):
                if h_catced[i]: continue
                mx, my = h_movers[i][0], h_movers[i][1]
                # 시야내에 도망자가 있는 경우
                if [nx, ny] == [mx, my]:
                    # 도망자 잡힙
                    h_catced[i] = True
                    count += 1

            for i in range(len(v_movers)):
                if v_catced[i]: continue
                mx, my = v_movers[i][0], v_movers[i][1]
                # 시야내에 도망자가 있는 경우
                if [nx, ny] == [mx, my]:
                    # 도망자 잡힙
                    v_catced[i] = True
                    count += 1

    return round * count

def solution(n, m, h, k, movers, trees):
    score = 0

    for i in range(1, k + 1):
        moveMovers()
        if direction == 0:
            moveCatcher_clock()
        else:
            moveChatcer_nonClock()
        score += catch(i)
    return score

print(solution(n, m, h, k, movers, trees))
