def solution(target):
    d = [[float('inf'), 0] for _ in range(target + 1)]
    d[0] = [0, 0]
    scores = set()
    for i in range(1, 21):
        scores.add(i)
        scores.add(i * 2)
        scores.add(i * 3)
    scores.add(50)
    
    for i in range(1, target + 1):
        for score in scores:
            if i - score < 0: continue
            single_or_bull = 1 if score <= 20 or score == 50 else 0
            if d[i - score][0] + 1 < d[i][0]:
                d[i] = [d[i - score][0] + 1, d[i - score][1] + single_or_bull]
            if d[i - score][0] + 1 == d[i][0]:
                d[i][1] = max(d[i - score][1] + single_or_bull, d[i][1])
                
    return d[target]
