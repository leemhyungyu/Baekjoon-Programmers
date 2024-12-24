from collections import deque

def checkPosition(rectangle, b_x, b_y, x, y):
    now_on_line = set()
    next_on_line = set()
    
    for n, (x1, y1, x2, y2) in enumerate(rectangle):
        # 현재 위치가 경계에 있는지 확인
        if (b_x in [x1, x2] and y1 <= b_y <= y2) or (b_y in [y1, y2] and x1 <= b_x <= x2):
            now_on_line.add(n)
        # 다음 위치가 경계에 있는지 확인
        if (x in [x1, x2] and y1 <= y <= y2) or (y in [y1, y2] and x1 <= x <= x2):
            next_on_line.add(n)
        
        # 다음 위치가 사각형 내부에 있는 경우 이동 불가
        if x1 < x < x2 and y1 < y < y2:
            return False

        # 이동 경로가 사각형을 뚫고 지나가는 경우 이동 불가
        if (len(set([x1, x2]) & set([b_x, x])) == 2 and y1 < b_y < y2) or \
           (len(set([y1, y2]) & set([b_y, y])) == 2 and x1 < b_x < x2):
            return False

    # 현재 위치와 다음 위치가 같은 사각형의 경계 위에 있는 경우만 이동 가능
    if len(now_on_line & next_on_line) == 0:
        return False

    return True

def solution(rectangle, characterX, characterY, itemX, itemY):
    dxdy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    visited = [[False for _ in range(51)] for _ in range(51)]
    
    def bfs(start_x, start_y):
        q = deque()
        q.append((start_x, start_y, 0))
        visited[start_x][start_y] = True
        
        while q:
            x, y, count = q.popleft()
            if (x, y) == (itemX, itemY):
                return count
        
            for i in dxdy:
                nx, ny = x + i[0], y + i[1]
                if 0 <= nx <= 50 and 0 <= ny <= 50:
                    if visited[nx][ny]: continue
                    if checkPosition(rectangle, x, y, nx, ny):
                        q.append((nx, ny, count + 1))
                        visited[nx][ny] = True
        
        return 0
    
    return bfs(characterX, characterY)
