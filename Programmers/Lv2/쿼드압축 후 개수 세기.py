def solution(arr):
    n = len(arr)
    answer = [0, 0]
    dxdy = [(0, 0), (0, 1), (1, 0), (1, 1)]
    
    def search(x, y, n, arr):
        target = arr[x][y]
        result = check(x, y, n, arr)
    
        if result:
            for i in dxdy:
                nx = x + i[0] * (n // 2)
                ny = y + i[1] * (n // 2)
                search(nx, ny, n // 2, arr)
        
        else: 
            if target == 0: answer[0] += 1
            else: answer[1] += 1
        
    def check(x, y, n, arr):
        target = arr[x][y]
    
        for i in range(x, x + n):
            for j in range(y, y + n):
                if target != arr[i][j]: return True
            
        return False
    
    search(0, 0, n, arr)

    return answer
