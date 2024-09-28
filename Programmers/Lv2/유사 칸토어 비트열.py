def solution(n, l, r):
    answer = 0
    for i in range(l - 1, r):
        if not isZero(i): answer += 1
    return answer

def isZero(x):
    while x >= 5:
        if x % 5 == 2: return True
        x //= 5
    return x == 2
