def solution(n, s):
    answer = []
    
    if n > s: return [-1]
    
    num = s // n
    rest = s % n
    
    answer = [num for _ in range(n)]
    
    if rest == 0: return answer
    
    for i in range(len(answer)):
        answer[i] += 1
        rest -= 1
        if rest == 0: break
    
    answer.sort()
    return answer

    
