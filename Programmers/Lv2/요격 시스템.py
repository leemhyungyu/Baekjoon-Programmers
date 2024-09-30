def solution(targets):
    targets.sort(key=lambda x : x[1])
    answer = 0
    end = -1
    for target in targets:
        if target[0] < end: continue
        answer += 1
        end = target[1]
        
    return answer
