# www.acmicpc.net/problem/12865
# 백준 12865번 문제: 평범한 배낭

n, k = map(int, input().split())
pack = [[0, 0]]
d = [[0 for _ in range(k + 1)] for _ in range(n + 1)]

for _ in range(n):
  pack.append(list(map(int, input().split())))

for i in range(1, n + 1):
  for j in range(1, k + 1):
    w = pack[i][0]
    v = pack[i][1]

    if j < w:
      d[i][j] = d[i - 1][j]
    else:
      d[i][j] = max(d[i - 1][j], d[i - 1][j - w] + v)

print(d[n][k])
    
