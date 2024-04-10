from collections import deque
import sys
input = sys.stdin.readline
array = [list(map(int, input().split())) for _ in range(9)]
 
def solution(array):
    empty = []
    for i in range(9):
        for j in range(9):
            if array[i][j] == 0:
                empty.append((i, j))


    def find(index):
        if index == len(empty):
            for i in array:
                print(*i)
            exit()
        
    
        x, y = empty[index][0], empty[index][1]

        for n in range(1, 10):
            if checkColumn((x, y), n) and checkRow((x, y), n) and checkSquare((x, y), n):
                array[x][y] = n
                find(index + 1)
                array[x][y] = 0

    find(0)
    

def checkColumn(pos, n):
    x, y = pos[0], pos[1]

    for nx in range(0, 9):
        if array[nx][y] == n:
            return False
    
    return True

def checkRow(pos, n):
    x, y = pos[0], pos[1]

    for ny in range(0, 9):
        if array[x][ny] == n:
            return False
            
    return True

def checkSquare(pos, n):
    x, y = pos[0], pos[1]

    for nx in range(3 * (x // 3), 3 * (x // 3) + 3):
        for ny in range(3 * (y // 3), 3 * (y // 3) + 3):
            if array[nx][ny] == n:
                return False
            
    return True

solution(array)

