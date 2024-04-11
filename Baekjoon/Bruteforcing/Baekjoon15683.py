import sys, copy
input = sys.stdin.readline
n, m = map(int, input().split())
array = [list(map(int, input().split())) for _ in range(n)]
visited = [[False] * m for _ in range(n)]
cctvList = []
result = 1e9

def solution(array, n, m):
    for i in range(n):
        for j in range(m):
            if 1 <= array[i][j] <= 5:
                cctvList.append((i, j, array[i][j]))

    
    dfs(0)
    return result

def dfs(index):
    global visited, result
    if index == len(cctvList):
        result = min(result, sqaureArea())
        return

    x, y, number = cctvList[index][0], cctvList[index][1], cctvList[index][2]
    visited[x][y] = True
    
    # direction 바라보고 있는 방향
    tempVisited = copy.deepcopy(visited)

    if number == 5:
        searchLeft(x, y)
        searchRight(x, y)
        searchDown(x, y)
        searchUp(x, y)
        dfs(index + 1)
        visited = copy.deepcopy(tempVisited)
        return
    
    for i in range(4):
        if number == 5:
            searchLeft(x, y)
            searchRight(x, y)
            searchDown(x, y)
            searchUp(x, y)
            dfs(index + 1)
            visited = copy.deepcopy(tempVisited)
            continue
                
        # up
        if i == 0:
            searchRight(x, y)
            if number == 2:
                searchLeft(x, y)
            elif number == 3:
                searchUp(x, y)
            elif number == 4:
                searchLeft(x, y)
                searchUp(x, y)
        # right
        elif i == 1:
            searchDown(x, y)
            if number == 2:
                searchUp(x, y)
            elif number == 3:
                searchRight(x, y)
            elif number == 4:
                searchUp(x, y)
                searchRight(x, y)

        # down
        elif i == 2:
            searchLeft(x, y)
            if number == 2:
                searchRight(x, y)
            elif number == 3:
                searchDown(x, y)
            elif number == 4:
                searchRight(x, y)
                searchDown(x, y)
        # left
        else:
            searchUp(x, y)
            if number == 2:
                searchDown(x, y)
            elif number == 3:
                searchLeft(x, y)
            elif number == 4:
                searchDown(x, y)
                searchLeft(x, y)

        dfs(index + 1)
        visited = copy.deepcopy(tempVisited)


def searchRight(x, y):
    for i in range(y, m):
        if array[x][i] == 6: break
        visited[x][i] = True
            
def searchLeft(x, y):
    for i in range(y, -1, -1):
        if array[x][i] == 6: break
        visited[x][i] = True

def searchUp(x, y):
    for i in range(x, -1, -1):
        if array[i][y] == 6: break
        visited[i][y] = True

def searchDown(x, y):
    for i in range(x, n):
        if array[i][y] == 6: break
        visited[i][y] = True
            
# 사각지대의 개수를 리턴
def sqaureArea():
    count = 0
    for i in range(n):
        for j in range(m):
            if not visited[i][j] and array[i][j] != 6 :
                count += 1
    return count


print(solution(array, n, m))
