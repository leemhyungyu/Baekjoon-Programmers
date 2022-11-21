#https://www.acmicpc.net/problem/6064 #백준 6064번 문제: 카잉 달력

t = int(input())
m, n, x, y = map(int, input().split())

year = 1

king = [[-1] * 199 for _ in range(100)]

print(king)
king[1][1] = 1
index_x = 1
index_y = 1
cnt = 0
while True:

  # x와 y가 둘다 m, n보다 작을 경우
  if index_x < m and index_y < n:
    index_x += 1
    index_y += 1
    year += 1
    king[index_x][index_y] = year
  
  # x는 m보다 크고, y는 n보다 작을 경우
  elif index_x > m and index_y < n:
    index_x = 1
    index_y += 1
    year += 1
    king[index_x][index_y] = year
  # x는 m보다 작고, y는 m보다 클 경우
  elif index_x < m and index_y > n:
    index_x += 1
    index_y = 1
    year += 1
    king[index_x][index_y] = year
    
  # x, y가 m, n보다 클 경우
  elif index_x > m and index_y > m:
    index_x, index_y = 1, 1
    year += 1
    king[index_x][index_y] = year

  # x == m, y == n 일 경우 중지
  if index_x == m and index_y == n:
    break

  
  print(king[index_x][index_y])
  
print(king[x][y])

