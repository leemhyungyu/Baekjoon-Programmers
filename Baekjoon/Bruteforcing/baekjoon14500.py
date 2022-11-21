# www.acmicpc.net/problem/1107
# 백준 14500번: 테트로미노

def findMaxValue(x, y):
  maxValue = 0
  index_x = 0
  index_y = 0  
    
  for i in range(4):
    nx = dx[i] + x
    ny = dy[i] + y
  
    if 0 <= nx <= m - 1 and 0 <= ny <= n - 1:
      if array[nx][ny] >= maxValue:
        maxValue = array[nx][ny]
        index_x = nx
        index_y = ny
    else:
      continue
  
  arrayForMaxValue.append([index_x, index_y])
  
  return maxValue
    
n, m = map(int, input().split())

array = []
arrayForMaxValue = []
result = 0
resultArray = []
# 상, 하, 좌, 우
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

for i in range(n):
  array.append(list(map(int, input().split())))

for x, y in arrayForMaxValue:
    print(x, y)
    
for i in range(n):
  for j in range(m):
    maxResult = 0
    arrayForMaxValue.append([i, j])
    for k in range(4):
      result = findMaxValue(i, j)
      
      for _ in range(len(arrayForMaxValue)):

        for x, y in arrayForMaxValue:
          temp = findMaxValue(x, y)

          if temp > maxResult:
            maxResult = temp
            
      result += maxResult    
        
print(result)
