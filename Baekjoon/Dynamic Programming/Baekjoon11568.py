import sys
input = sys.stdin.readline
n = int(input())
cards = list(map(int, input().split()))

def solution(cards, n):
    d = [1 for _ in range(n)]

    for i in range(n):
        for j in range(i):
            if cards[j] < cards[i]:
                d[i] = max(d[i], d[j] + 1)
    return max(d)

print(solution(cards, n))

