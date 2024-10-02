def solution(n, money):
    d = [1] + [0 for _ in range(n)]

    for i in money:
        for j in range(i, n + 1):
            if j < j: continue
            d[j] += d[j - i]    

    return d[n]

