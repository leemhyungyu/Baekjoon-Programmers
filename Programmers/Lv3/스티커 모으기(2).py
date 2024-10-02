def solution(sticker):
    n = len(sticker)
    d1 = [0 for _ in range(n)] # 0번째 인덱스 스티커 뜯음
    d2 = [0 for _ in range(n)] # 1번째 인덱스 스티커 뜯음

    if n == 1: return sticker[0]
    # 0번째 인덱스 스티커 뜯고 시작
    for i in range(n - 1):
        d1[i] = max(sticker[i] + d1[i - 2], d1[i - 1])
        
    # 1번째 인덱스 스티커 뜯고 시작
    for i in range(1, n):
        d2[i] = max(sticker[i] + d2[i - 2], d2[i - 1])

    return max(max(d1), max(d2)) 
