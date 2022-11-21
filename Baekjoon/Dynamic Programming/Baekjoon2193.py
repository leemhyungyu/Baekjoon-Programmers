# 백준 2193번: 이친수(다이나믹 프로그래밍)

# 이친수라 함은, 이진수중에서 0으로 시작하지 않고, 1이 두번 역속 나타나지 않는 수를 의미

n = int(input())

d = [0 for _ in range(n + 2)]

d[1] = 1
d[2] = 1

for i in range(3, n + 1):
  d[i] = d[i - 1] + d[i - 2]

print(d[n])
