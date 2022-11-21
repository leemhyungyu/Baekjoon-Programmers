#https://www.acmicpc.net/problem/9375
# 백준 9375번 문제: 패션왕 신해빈
t = int(input())

for _ in range(t):
    kind = {}
    n = int(input())
    count = 1

    for _ in range(n):
        x, y = input().split()

        if y not in kind:
            kind[y] = 1
        else:
            kind[y] += 1

    for i in kind.keys():
        count *= (kind[i] + 1)

    print(count - 1)
